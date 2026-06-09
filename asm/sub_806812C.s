	.syntax unified
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806812C, "ax", %progbits
@ sub_806812C @ JP 0x0806812C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806812C
	.thumb_func
sub_806812C:
	push {lr}
	ldr r0, _08068144 @ =0x086BF6E8
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08068148 @ =0x086BF2B8
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	pop {r0}
	bx r0
	.align 2, 0
_08068144: .4byte 0x086BF6E8
_08068148: .4byte 0x086BF2B8

