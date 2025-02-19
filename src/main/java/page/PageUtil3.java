package page;

public class PageUtil3 {
	public static final int PAGE_SCALE = 12;
	// 페이지 블록 단위(한 화면에 보여줄 페이지 수)
	public static final int BLOCK_SCALE = 10;
	private int curPage; // 현재 페이지
	private int prevPage; // 이전 페이지
	private int nextPage; // 다음 페이지
	private int totPage; // 전체 페이지 개수
	private int totBlock; // 전체 블록 개수
	private int curBlock; // 현재 페이지 블록
	private int prevBlock; // 이전 페이지 블록
	private int nextBlock; // 다음 페이지 블록
	private int pageBegin; // 현재 페이지 시작 번호
	private int pageEnd; // 현재 페이지 끝 번호
	private int blockStart; // 현재 블록의 시작 번호
	private int blockEnd; // 현재 블록의 끝 번호

	public PageUtil3(int count, int curPage) {
		curBlock = 1;
		this.curPage = curPage;
		setTotPage(count); // 전체 페이지 개수 설정
		setPageRange();
		setTotBlock(); // 전체 페이지 블록 개수 설정
		// curPage가 속한 페이지 블록의 시작번호, 끝번호 계산
		setBlockRange();
	}

	public void setTotBlock() {
		// 전체 페이지 개수 / 페이지 블록 단위
		totBlock = (int) Math.ceil(totPage * 1.0 / BLOCK_SCALE);
	}

	public void setBlockRange() {
		// curPage가 몇 번째 페이지 블록에 속하는지 계산
		curBlock = (int) Math.ceil((curPage - 1) / BLOCK_SCALE) + 1;
		// 현재 페이지 블록의 시작, 끝 번호 설정
		blockStart = (curBlock - 1) * BLOCK_SCALE + 1;
		blockEnd = blockStart + BLOCK_SCALE - 1;
		// 마지막 블록이 범위를 초과하지 않도록 처리
		if (blockEnd > totPage) {
			blockEnd = totPage;
		}
		// [이전]을 눌렀을 때 이동할 페이지
		prevPage = (curBlock == 1) ? 1 : (curBlock - 1) * BLOCK_SCALE;
		// [다음]을 눌렀을 때 이동할 페이지
		nextPage = (curBlock > totBlock) ? (curBlock * BLOCK_SCALE) : (curBlock * BLOCK_SCALE) + 1;
		// 마지막 페이지가 범위를 초과하지 않도록 처리
		if (nextPage >= totPage) {
			nextPage = totPage;
		}
	}

	// curPage(현재 페이지)의 시작번호, 끝번호 계산
	public void setPageRange() {
		// 시작번호: (현재 페이지 - 1) * 페이지당 게시물 수 + 1
		pageBegin = (curPage - 1) * PAGE_SCALE + 1;
		// 끝번호: 시작번호 + 페이지당 게시물 수 - 1
		pageEnd = pageBegin + PAGE_SCALE - 1;
	}

	public void setTotPage(int count) {
		totPage = (int) Math.ceil(count * 1.0 / PAGE_SCALE);
	}

	public int getTotBlock() {
		return totBlock;
	}

	public void setTotBlock(int totBlock) {
		this.totBlock = totBlock;
	}

	public int getTotPage() {
		return totPage;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getCurBlock() {
		return curBlock;
	}

	public void setCurBlock(int curBlock) {
		this.curBlock = curBlock;
	}

	public int getPrevBlock() {
		return prevBlock;
	}

	public void setPrevBlock(int prevBlock) {
		this.prevBlock = prevBlock;
	}

	public int getNextBlock() {
		return nextBlock;
	}

	public void setNextBlock(int nextBlock) {
		this.nextBlock = nextBlock;
	}

	public int getPageBegin() {
		return pageBegin;
	}

	public void setPageBegin(int pageBegin) {
		this.pageBegin = pageBegin;
	}

	public int getPageEnd() {
		return pageEnd;
	}

	public void setPageEnd(int pageEnd) {
		this.pageEnd = pageEnd;
	}

	public int getBlockStart() {
		return blockStart;
	}

	public void setBlockStart(int blockStart) {
		this.blockStart = blockStart;
	}

	public int getBlockEnd() {
		return blockEnd;
	}

	public void setBlockEnd(int blockEnd) {
		this.blockEnd = blockEnd;
	}

}
