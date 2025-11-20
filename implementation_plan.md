# Improving Playlist Handling

The goal is to improve how playlists are handled. Currently, they are treated as single videos or not explicitly supported in the UI. The user wants playlists to be downloaded to the server but *not* automatically pushed to the client, and to be clearly marked in the history.

## User Review Required
> [!IMPORTANT]
> Playlists will now be downloaded into subdirectories within the `downloads` folder. This changes the file structure.
> Automatic download to the client browser will be DISABLED for playlists.

## Proposed Changes

### Backend (`app.py`)

#### [MODIFY] [app.py](file:///j:/Apps/YTEXtract/app.py)
- **`get_info`**: Update to check if the URL is a playlist. Return `is_playlist` flag and playlist metadata (title, video count).
- **`start_download`**: 
    - If it's a playlist, set `noplaylist=False`.
    - Use a subdirectory for the output template: `downloads/{PlaylistTitle}/%(title)s.%(ext)s`.
- **`get_history`**:
    - Update to list directories in `downloads/` as playlist items.
    - Calculate total size of the playlist folder.
- **`delete_file`**: Support deleting directories (playlists).

### Frontend (`templates/index.html`)

#### [MODIFY] [index.html](file:///j:/Apps/YTEXtract/templates/index.html)
- **`checkUrl`**: Handle `is_playlist` in the response. Update UI to show "Playlist: [Title]" and maybe the count.
- **`startPolling`**: 
    - Check if the completed task was a playlist.
    - If yes, show a success message ("Playlist downloaded to history") instead of redirecting to the file.
- **`loadHistory`**:
    - Render playlist items with a folder icon.
    - Maybe hide the "Download" button for the whole folder (or implement zipping later if requested, but for now just "View" or "Delete").

### Styles (`static/style.css`)

#### [MODIFY] [style.css](file:///j:/Apps/YTEXtract/static/style.css)
- Add styles for playlist items in history (e.g., `.fa-folder` icon, distinct styling).

## Verification Plan

### Manual Verification
- **Playlist Detection**: Enter a YouTube playlist URL. Verify the UI shows it's a playlist.
- **Download**: Start download. Verify it creates a folder in `downloads/`.
- **No Auto-Download**: Verify the browser does not attempt to download a file automatically upon completion.
- **History**: Verify the playlist appears as a folder in the history list.
- **Deletion**: Verify deleting the playlist removes the folder and its contents.
