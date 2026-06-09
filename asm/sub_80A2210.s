	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80A2210, "ax", %progbits
@ sub_80A2210 @ JP 0x080A2210 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A2210
	.thumb_func
sub_80A2210:
	push {lr}
	sub sp, #4
	ldr r3, _080A223C @ =0x085B8D24
	ldr r0, _080A2240 @ =0x0000B090
	str r0, [sp]
	movs r0, #4
	movs r1, #0x88
	movs r2, #0x48
	bl PutSpriteExt
	ldr r3, _080A2244 @ =0x085B8CFC
	ldr r0, _080A2248 @ =0x0000B094
	str r0, [sp]
	movs r0, #4
	movs r1, #0xa8
	movs r2, #0x48
	bl PutSpriteExt
	add sp, #4
	pop {r0}
	bx r0
	.align 2, 0
_080A223C: .4byte 0x085B8D24
_080A2240: .4byte 0x0000B090
_080A2244: .4byte 0x085B8CFC
_080A2248: .4byte 0x0000B094

