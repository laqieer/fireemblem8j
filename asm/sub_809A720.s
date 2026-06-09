	.syntax unified
	.set sub_8000D68, 0x08000D68 + 1
	.set sub_8013008, 0x08013008 + 1
	.section .text.sub_809A720, "ax", %progbits
@ sub_809A720 @ JP 0x0809A720 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_809A720
	.thumb_func
sub_809A720:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _0809A740 @ =0x08A97C94
	ldr r1, _0809A744 @ =0x06013000
	bl sub_8013008
	ldr r0, _0809A748 @ =0x08A980D0
	ldr r1, [r4, #0x34]
	adds r1, #0x10
	lsls r1, r1, #5
	movs r2, #0x20
	bl sub_8000D68
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_0809A740: .4byte 0x08A97C94
_0809A744: .4byte 0x06013000
_0809A748: .4byte 0x08A980D0

