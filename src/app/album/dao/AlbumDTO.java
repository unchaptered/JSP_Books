package app.album.dao;

public class AlbumDTO {
	
	// Field Variables
	
	private String albumPk;
	private String albumTitle;
	private String albumTitleSong;
	private String albumSinger;
	private String albumPrice;
	private String albumRelease;

	// Getters
	
	public String getAlbumPk() {
		return albumPk;
	}
	public String getAlbumTitle() {
		return albumTitle;
	}
	public String getAlbumTitleSong() {
		return albumTitleSong;
	}
	public String getAlbumSinger() {
		return albumSinger;
	}
	public String getAlbumPrice() {
		return albumPrice;
	}
	public String getAlbumRelease() {
		return albumRelease;
	}
	
	// Setters
	
	public void setAlbumPk(String albumPk) {
		this.albumPk = albumPk;
	}
	public void setAlbumTitle(String albumTitle) {
		this.albumTitle = albumTitle;
	}
	public void setAlbumTitleSong(String albumTitleSong) {
		this.albumTitleSong = albumTitleSong;
	}
	public void setAlbumSinger(String albumSinger) {
		this.albumSinger = albumSinger;
	}
	public void setAlbumPrice(String albumPrice) {
		this.albumPrice = albumPrice;
	}
	public void setAlbumRelease(String albumRelease) {
		this.albumRelease = albumRelease;
	}
	
	
}
