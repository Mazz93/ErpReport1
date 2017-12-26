package servlets;

import java.io.IOException;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BookingRepServlet")
public class BookingRepServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String compcode = request.getParameter("compcode");
		String brcode = request.getParameter("brcode");
		String frdt = request.getParameter("frdt");
		String todt = request.getParameter("todt");
		String cnr = request.getParameter("cnr");
		String cne = request.getParameter("cne");
		String partycode = request.getParameter("partycode");
		String disctcode = request.getParameter("disctcode");
		String tmode = request.getParameter("tmode");
		String frmode = request.getParameter("frmode");

		// System.out.println(from);
		// System.out.println(to);
		try {
			ConnectionDAO dao = new ConnectionDAO();
			Statement statement = dao.getConnection();
			String qry = "SELECT M.CN_BRANCH_CODE," + "M.CN_CN_NO,"
					+ "trunc(nvl(M.CN_mamual_CN_DATE,M.CN_CN_DATE)) CN_DATE,"
					+ "BR.BRANCH_BRANCH_NAME FROMSOURCE," + "BR1.BRANCH_BRANCH_NAME TODIST,"
					+ "CUST.CUSTOMER_CUSTOMER_NAME CNR," + "CUST1.CUSTOMER_CUSTOMER_NAME CEE," + "D.CN_PKG,"
					+ "D.CN_ACTUAL_WEIGHT," + "D.CN_CHARGED_WEIGHT CN_C_WEIGHT,"
					+ "SUM(NVL(F.CN_TOTAL,0))CN_TOTAL_TOTAL," + "REPLACE(D.CN_INVOICE_NO,',','-')CN_INVOICE_NO,"
					+ "D.CN_PART_NUMBER," + "D.CN_QUANTITY," + "CD.SYSCDS_CODE_DESC,"
					+ "nvl(bf.BILL_BILL_NO,(SELECT MR_MANUAL_MR_NO  FROM OPS_mr_M BM,OPS_mr_d BD WHERE BM.MR_MR_NO=BD.MR_MR_NO"
					+ "AND BD.MR_NEW_DOC_NO =M.CN_CN_NO"
					+ "AND NVL(BM.MR_CANCEL_FLAG ,'N')='N' AND nvl(BD.MR_TOT,0)>0 and rownum=1 ) ) CN_BILL_NO,"
					+ "nvl(bf.BILL_TOTAL_TOTAL ,(SELECT SUM(MR_ACT)  FROM OPS_mr_M BM,OPS_mr_d BD WHERE BM.MR_MR_NO=BD.MR_MR_NO"
					+ "AND BD.MR_NEW_DOC_NO =M.CN_CN_NO"
					+ "AND NVL(BM.MR_CANCEL_FLAG ,'N')='N' AND nvl(BD.MR_TOT,0)>0  ) ) CN_MR_BILL_AMT,"
					+ "TO_CHAR(CN_DELIVERY_DATE,'DD-MON-RRRR')DELIVERY_DATE," + "CN_DDR_NO,"
					+ "m.CN_aDR_NO," + "TO_CHAR(M.CN_POD_REC_DATE,'DD-MON-RRRR')CN_POD_REC_DATE,"
					+ "TO_CHAR(M.CN_ADR_DATE,'DD-MON-RRRR') CN_ADR_DATE," + "M.CN_MANUAL_CN_NO,"
					+ "to_char(M.CN_MAMUAL_CN_DATE,'DD-MON-RRRR')MANUAL_CN_DATE,"
					+ "REPLACE(M.CN_REMARKS,',','-')CN_REMARKS," + "CD1.SYSCDS_CODE_DESC tptr_mode,"
					+ "CD2.SYSCDS_CODE_DESC DELIVERY_POINT," + "--M.cn_transit_status T_STATUS,"
					+ "            DECODE (M.cn_transit_status,"
					+ "                    '1', 'Ware house -['||br2.BRANCH_SHRT_NAME ||']' ,"
					+ "                    '2', (Select * from"
					+ "(select 'In Transit '||'['||B.BRANCH_SHRT_NAME||'-'||BT.BRANCH_SHRT_NAME||']'"
					+ "from OPS_CHALLAN_M M1, OPS_CHALLAN_D D,"
					+ "ops_cn_m cnm, COR_BRANCH_M B, COR_BRANCH_M BT" + "where M1.CHLN_CHLN_NO=D.CHLN_CHLN_NO"
					+ "  and D.CHLN_cn_no= cnm.CN_cn_no"
					+ "  and (cnm.CN_cn_no=M.CN_CN_NO or cnm.CN_MANUAL_cn_no=M.CN_CN_NO)"
					+ "  AND M1.CHLN_FROM=B.BRANCH_BRANCH_CODE" + "  AND M1.CHLN_TO=BT.BRANCH_BRANCH_CODE"
					+ "order by NVL(CHLN_MANUAL_CHLN_DATE,CHLN_CHLN_DATE) desc )" + "where rownum=1),"
					+ "                    '3', (Select * from"
					+ "(select  'Ware House'||'-'||B.BRANCH_SHRT_NAME ||'-'||TO_CHAR(M1.CHLN_GATE_IN_DATE, 'dd-mm-yyyy')"
					+ "from OPS_CHALLAN_M M1, OPS_CHALLAN_D D," + "ops_cn_m cnm, COR_BRANCH_M B"
					+ "where M1.CHLN_CHLN_NO=D.CHLN_CHLN_NO" + "  and D.CHLN_cn_no= cnm.CN_cn_no"
					+ "  and (cnm.CN_cn_no=M.CN_CN_NO or cnm.CN_MANUAL_cn_no=M.CN_CN_NO)"
					+ "  AND cnm.CN_CURRENT_BRANCH_CODE=B.BRANCH_BRANCH_CODE"
					+ "  order by NVL(CHLN_MANUAL_CHLN_DATE,CHLN_CHLN_DATE) desc)" + "where rownum=1),"
					+ "                    '4', 'OUT for Delivery as on '||to_char(m.CN_DELIVERY_DATE,'dd-mon-yy'),"
					+ "                              'Delivered as on '||to_char(m.CN_DELIVERY_DATE,'dd-mon-yy')"
					+ "                   ) status,m.CN_ENTER_BY,CD3.SYSCDS_CODE_DESC  CN_PACKING_TYPE"
					+ "                   --M.CN_REASON" + "                   FROM" + "OPS_CN_M M,"
					+ "OPS_CN_D D," + "OPS_CN_FRIGHT F," + "COR_BRANCH_M BR," + "COR_BRANCH_M BR1,"
					+ "COR_BRANCH_M BR2," + "COR_SYSCODES CD," + "COR_SYSCODES CD1,"
					+ "COR_SYSCODES CD2," + "COR_SYSCODES CD3," + "COR_CUSTOMER_M CUST,"
					+ "COR_CUSTOMER_M CUST1," + "OPS_BILL_FRIGHT bf" + "WHERE M.CN_CN_NO=D.CN_CN_NO"
					+ "and M.CN_CN_NO=bf.BILL_CN_NO(+)" + "AND M.CN_CN_NO=F.CN_CN_NO"
					+ "AND M.CN_SOURCE_BRANCH_CODE=BR.BRANCH_BRANCH_CODE"
					+ "and M.CN_DESTINATION_BRANCH_CODE=BR1.BRANCH_BRANCH_CODE"
					+ "AND CUST.CUSTOMER_CUSTOMER_CODE=m.CN_CONSIGNOR_CODE"
					+ "AND CUST1.CUSTOMER_CUSTOMER_CODE=M.CN_CONSIGNEE_CODE"
					+ "AND CD.SYSCDS_CODE_VALUE=M.CN_FREIGHT_PAID_MODE"
					+ "AND CD.SYSCDS_CODE_TYPE='OPS_FRE_MODE'" + "AND CD1.SYSCDS_CODE_VALUE=M.CN_TPTR_MODE"
					+ "AND CD1.SYSCDS_CODE_TYPE='OPS_MODE'" + "AND CD2.SYSCDS_CODE_VALUE=M.CN_DELIVERY_POINT"
					+ "AND CD2.SYSCDS_CODE_TYPE='OPS_DEL_POINT'" + "AND CD3.SYSCDS_CODE_TYPE='PKG_TYPE'"
					+ "AND CD3.SYSCDS_CODE_VALUE=D.CN_PACKING_TYPE"
					+ "and m.CN_CURRENT_BRANCH_CODE=br2.BRANCH_BRANCH_CODE" + "AND CN_CN_STATUS=1"
					+ "--AND M.CN_CN_NO=2802161000215"
					+ "AND( (BR.BRANCH_CNTRL_BRANCH_CODE  < CASE WHEN "+brcode+"=9999 then "+brcode+" END"
					+ " OR BR.BRANCH_CNTRL_BRANCH_CODE  = CASE WHEN "+brcode+"!=9999 then "+brcode+" END"
					+ "  )" + "or"
					+ "( BR.BRANCH_BRANCH_CODE  < CASE WHEN "+brcode+"=9999 then "+brcode+" END"
					+ " OR  BR.BRANCH_BRANCH_CODE = CASE WHEN "+brcode+"!=9999 then "+brcode+" END"
					+ "  ))"
					+ "and TO_DATE(to_char(nvl(M.CN_mamual_CN_DATE,M.CN_CN_DATE),'dd/mm/yyyy'),'dd/mm/yyyy') BETWEEN "+frdt+" AND "+todt+""
					+ "AND( m.CN_CONSIGNOR_CODE < CASE WHEN "+cnr+"= 999999 THEN "+cnr+" END"
					+ "OR m.CN_CONSIGNOR_CODE = CASE WHEN "+cnr+"!= 999999 THEN "+cnr+" END" + ")"
					+ "AND (M.CN_CONSIGNEE_CODE < CASE WHEN "+cne+"= 999999  THEN "+cne+" END"
					+ "OR M.CN_CONSIGNEE_CODE = CASE WHEN  "+cne+"!=999999  THEN "+cne+" END" + ")"
					+ "AND (M.CN_BLLING_PARTY_CODE < CASE WHEN "+partycode+"=999999 THEN "+partycode+" END"
					+ " OR M.CN_BLLING_PARTY_CODE = CASE WHEN "+partycode+"!=999999 THEN "+partycode+" END"
					+ ")"
					+ "and (M.CN_DESTINATION_BRANCH_CODE < CASE WHEN "+disctcode+"=9999 THEN "+disctcode+" END"
					+ "OR M.CN_DESTINATION_BRANCH_CODE = CASE WHEN "+disctcode+"!=9999 THEN "+disctcode+" END"
					+ ")" + "AND (M.CN_TPTR_MODE < CASE WHEN "+tmode+"=9 THEN "+tmode+" END"
					+ "OR M.CN_TPTR_MODE = CASE WHEN "+tmode+"!=9 THEN "+tmode+" END" + ")"
					+ "AND (M.CN_FREIGHT_PAID_MODE < CASE WHEN "+frmode+"=9 THEN "+frmode+" END"
					+ "OR M.CN_FREIGHT_PAID_MODE = CASE WHEN "+frmode+"!=9 THEN "+frmode+" END" + ")"
					+ "AND M.CN_COMPANY_CODE="+compcode+""
					+ "GROUP BY M.CN_BRANCH_CODE,M.CN_CN_NO,trunc(nvl(M.CN_mamual_CN_DATE,M.CN_CN_DATE)),BR.BRANCH_BRANCH_NAME ,BR1.BRANCH_BRANCH_NAME,"
					+ "CUST.CUSTOMER_CUSTOMER_NAME ,CUST1.CUSTOMER_CUSTOMER_NAME,D.CN_CHARGED_WEIGHT,"
					+ "D.CN_PKG,D.CN_ACTUAL_WEIGHT,D.CN_INVOICE_NO,D.CN_PART_NUMBER,D.CN_QUANTITY,"
					+ "CD.SYSCDS_CODE_DESC,bf.BILL_TOTAL_TOTAL,"
					+ "M.CN_BILL_NO,TO_CHAR(CN_DELIVERY_DATE,'DD-MON-RRRR'),CN_DDR_NO,m.CN_aDR_NO,"
					+ "TO_CHAR(M.CN_POD_REC_DATE,'DD-MON-RRRR'),TO_CHAR(M.CN_ADR_DATE,'DD-MON-RRRR'),"
					+ "to_char(m.CN_MAMUAL_CN_DATE,'DD-MON-RRRR'),M.CN_MANUAL_CN_NO,M.CN_REMARKS,"
					+ "CD1.SYSCDS_CODE_DESC,CD2.SYSCDS_CODE_DESC,M.cn_transit_status,"
					+ "            DECODE (M.cn_transit_status," + "                    '1', 'Ware house',"
					+ "                    '2', 'In Transit'," + "                    '3', 'Ware House',"
					+ "                    '4', 'OUT for Delivery'," + "                     'Delivered'"
					+ "                   ) ,M.CN_REASON,br2.BRANCH_SHRT_NAME,m.CN_DELIVERY_DATE,bf.BILL_BILL_NO,m.CN_ENTER_BY,CD3.SYSCDS_CODE_DESC"
					+ "ORDER BY BR.BRANCH_BRANCH_NAME,trunc(nvl(M.CN_mamual_CN_DATE,M.CN_CN_DATE))";

			ResultSet rs = statement.executeQuery(qry);
			HttpSession session = request.getSession(false);
			session.setAttribute("resulset", rs);
			response.sendRedirect("BookingDownload.jsp");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

}
