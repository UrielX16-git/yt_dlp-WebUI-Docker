# Playlist Handling Improvements Walkthrough

I have implemented the requested improvements for handling playlists.

## Changes

### Backend (`app.py`)
- **Playlist Detection**: `get_info` now detects if a URL is a playlist and returns `is_playlist` and `playlist_count`.
- **Folder-based Download**: `start_download` now creates a subdirectory for playlists using the playlist title.
- **History Update**: `get_history` now recognizes directories in the `downloads` folder as playlists and calculates their total size.
- **Deletion**: `delete_file` now supports deleting entire directories (playlists).

### Frontend (`index.html` & `style.css`)
- **Playlist Badge**: Added a "PLAYLIST" badge in the video details section when a playlist URL is detected.
- **No Auto-Download**: When a playlist download completes, the browser will *not* attempt to download a file automatically. Instead, a success message is shown.
- **History UI**: Playlist items in the history list now show a folder icon and have the direct download button disabled (since it's a folder).
- **Styles**: Added styles for the badge and disabled buttons.

## Verification Results

### Docker Rebuild
The Docker container was successfully rebuilt and restarted with the new changes.
```
Container ytextract  Recreated
Container ytextract  Started
```

### Manual Verification Steps
1.  **Enter Playlist URL**: Paste a YouTube playlist URL.
2.  **Check Info**: Verify the "PLAYLIST" badge appears.
3.  **Download**: Click "Descargar".
4.  **Completion**: Wait for completion. Verify no file is downloaded to your computer automatically.
5.  **History**: Check the history list. The playlist should appear with a folder icon.
6.  **Delete**: Click the trash icon to delete the playlist from the server.
