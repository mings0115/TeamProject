package group1.controller;

import group1.action.Account;
import group1.action.AcountForm;
import group1.action.Action;
import group1.action.BoardDeleteAction;
import group1.action.BoardDetailAction;
import group1.action.BoardDetailFormAction;
import group1.action.BoardListAction;
import group1.action.BoardNoticeFormAction;
import group1.action.BoardReplyAction;
import group1.action.BoardReplyFormAction;
import group1.action.BoardUpdateAction;
import group1.action.BoardUpdateFormAction;
import group1.action.BoardWriteAction;
import group1.action.BoardWriteForm;
import group1.action.CommentDeleteAction;
import group1.action.CommentReplyAction;
import group1.action.CommentReplyFormActon;
import group1.action.CommentUpdateAction;
import group1.action.CommentUpdateFormAction;
import group1.action.CommentWriteAction;
import group1.action.FileDownloadAction;
import group1.action.IconInsertAction;
import group1.action.IdCheckAction;
import group1.action.Login;
import group1.action.LoginForm;
import group1.action.Logout;
import group1.action.Main;
import group1.action.Modify;
import group1.action.ModifyForm;
import group1.action.ProfileFormAction;
import group1.action.ShopFormAction;
import group1.action.game.LOLRecordAction;
import group1.action.game.OwActionTest;
import group1.action.game.PubgActionTest;

public class ActionFactory {

	private static ActionFactory instance = null;

	public static ActionFactory getInstance() {
		if (instance == null)
			instance = new ActionFactory();
		return instance;
	}

	public Action getAction(String url) {

		Action action = null;

		if (url == null || url.equals("/login.do")) { // 로그인
			action = new LoginForm();
		} else if (url.equals("/index.do")) // 메인
			action = new Main();
		else if (url.equals("/account.do")) // 회원가입 폼
			action = new AcountForm();
		else if (url.equals("/accountAccess.do")) // 회원가입
			action = new Account();
		else if (url.equals("/IdCheckAction.do"))
			action = new IdCheckAction();
		else if (url.equals("/loginAccess.do")) // 로그인 액션
			action = new Login();
		else if (url.equals("/logoutAccess.do"))// 로그아웃 액션
			action = new Logout();
		else if (url.equals("/Profile.do"))
			action = new ProfileFormAction();
		else if (url.equals("/Modify.do")) // 회원수정폼
			action = new ModifyForm();
		else if (url.equals("/ModifyAccess.do")) // 회원수정
			action = new Modify();
		else if (url.equals("/noticeboard.do"))
			action = new BoardNoticeFormAction();
		else if (url.equals("/board_list.do")) // 게시글 리스트 갱신
			action = new BoardListAction();
		else if (url.equals("/board_write.do")) // 게시글 작성폼
			action = new BoardWriteForm();
		else if (url.equals("/BoardWriteAction.do")) // 게시글 작성 액션
			action = new BoardWriteAction();
		else if (url.equals("/board_detail.do")) // 게시글 디테일 폼
			action = new BoardDetailFormAction();
		else if (url.equals("/BoardDetailAction.do")) // 게시글 디테일 액션
			action = new BoardDetailAction();
		else if (url.equals("/board_update.do")) // 게시글 수정폼
			action = new BoardUpdateFormAction();
		else if (url.equals("/BoardUpdateAction.do")) // 게시글 수정 액션
			action = new BoardUpdateAction();
		else if (url.equals("/board_reply.do")) // 게시글 답글폼
			action = new BoardReplyFormAction();
		else if (url.equals("/BoardReplyAction.do")) // 게시글 답글 액션
			action = new BoardReplyAction();
		else if (url.equals("/BoardDeleteAction.do")) // 게시글 삭제액션
			action = new BoardDeleteAction();
		else if (url.equals("/FileDownloadAction.do")) // 파일다운로드
			action = new FileDownloadAction();
		else if (url.equals("/CommentWriteAction.do")) // 댓글 액션
			action = new CommentWriteAction();
		else if (url.equals("/comment_update.do")) // 댓글 수정 폼
			action = new CommentUpdateFormAction();
		else if (url.equals("/CommentUpdateAction.do")) // 댓글 수정 액션
			action = new CommentUpdateAction();
		else if (url.equals("/comment_reply.do")) // 댓글 답글 폼
			action = new CommentReplyFormActon();
		else if (url.equals("/CommentReplyAction.do")) // 댓글 답글 액션
			action = new CommentReplyAction();
		else if (url.equals("/CommentDeleteAction.do")) // 댓글 삭제 액션
			action = new CommentDeleteAction();
		else if (url.equals("/Shop.do")) // 상점 이동 액션
			action = new ShopFormAction();
		else if (url.equals("/IconInsertAction.do"))
			action = new IconInsertAction();
		else if (url.equals("/lol.do"))
			action = new LOLRecordAction();
		else if (url.equals("/overwatch.do"))
			action = new OwActionTest();
		else if (url.equals("/pubg.do"))
			action = new PubgActionTest();

		System.out.println("action : " + action);

		return action;
	}

}
