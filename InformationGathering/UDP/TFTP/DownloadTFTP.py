import tftpy

client = tftpy.TftpClient('<IP>', 69)
client.download("<SERVERFILE>", "<OUTFILEPATH>", timeout=5)
#client.upload("filename to upload", "/local/path/file", timeout=5)
