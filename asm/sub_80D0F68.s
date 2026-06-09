	.syntax unified
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_80D0F68, "ax", %progbits
@ sub_80D0F68 @ JP 0x080D0F68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80D0F68
	.thumb_func
sub_80D0F68:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, _080D0F84 @ =0x020228A8
	ldr r1, _080D0F88 @ =0x02000000
	movs r2, #0x80
	lsls r2, r2, #1
	bl sub_80D636C
	movs r0, #4
	str r0, [r4, #0x34]
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080D0F84: .4byte 0x020228A8
_080D0F88: .4byte 0x02000000

