	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.set sub_80989D4, 0x080989D4 + 1
	.section .text.sub_80A4148, "ax", %progbits
@ sub_80A4148 @ JP 0x080A4148 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80A4148
	.thumb_func
sub_80A4148:
	push {r4, r5, r6, lr}
	sub sp, #4
	ldr r2, [r0, #0x30]
	movs r3, #0x8f
	lsls r3, r3, #6
	movs r0, #0x90
	movs r1, #3
	bl sub_80989D4
	movs r6, #0x9c
	lsls r6, r6, #5
	movs r5, #0x94
	movs r4, #2
_080A4162:
	str r6, [sp]
	movs r0, #4
	adds r1, r5, #0
	movs r2, #0x12
	ldr r3, _080A4184 @ =0x085B8D24
	bl PutSpriteExt
	adds r6, #4
	adds r5, #0x20
	subs r4, #1
	cmp r4, #0
	bge _080A4162
	add sp, #4
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080A4184: .4byte 0x085B8D24

