	.syntax unified
	.section .text.GetScanlineBufEntry, "ax", %progbits
@ GetScanlineBufEntry @ JP 0x08084984 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global GetScanlineBufEntry
	.thumb_func
GetScanlineBufEntry:
	ldr r2, _08084994 @ =0x0203E750
	lsls r0, r0, #2
	adds r0, r0, r2
	lsls r1, r1, #1
	ldr r0, [r0]
	adds r0, r0, r1
	bx lr
	.align 2, 0
_08084994: .4byte 0x0203E750

