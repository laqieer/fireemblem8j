	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_80BBF18, "ax", %progbits
@ sub_80BBF18 @ JP 0x080BBF18 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BBF18
	.thumb_func
sub_80BBF18:
	push {lr}
	ldr r0, _080BBF44 @ =0x08AC4C88
	movs r1, #0xe0
	lsls r1, r1, #1
	movs r2, #0x20
	bl sub_8000D68
	ldr r0, _080BBF48 @ =0x08AC4CA8
	ldr r1, _080BBF4C @ =0x06001000
	bl sub_8013008
	ldr r0, _080BBF50 @ =0x02023CA8
	ldr r1, _080BBF54 @ =0x08AC50A4
	ldr r2, _080BBF58 @ =0x0000E080
	bl j_TmApplyTsa
	movs r0, #4
	bl BG_EnableSyncByMask
	pop {r0}
	bx r0
	.align 2, 0
_080BBF44: .4byte 0x08AC4C88
_080BBF48: .4byte 0x08AC4CA8
_080BBF4C: .4byte 0x06001000
_080BBF50: .4byte 0x02023CA8
_080BBF54: .4byte 0x08AC50A4
_080BBF58: .4byte 0x0000E080

