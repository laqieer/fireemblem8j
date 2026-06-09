	.syntax unified
	.set PutSpriteExt, 0x08005330 + 1
	.section .text.sub_80CC590, "ax", %progbits
@ sub_80CC590 @ JP 0x080CC590 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80CC590
	.thumb_func
sub_80CC590:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	adds r5, r1, #0
	movs r4, #0
	movs r6, #4
_080CC59C:
	lsls r1, r4, #5
	str r6, [sp]
	movs r0, #0
	adds r2, r5, #0
	ldr r3, _080CC5D0 @ =0x085B8D34
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #7
	ble _080CC59C
	movs r4, #0
	movs r5, #0
_080CC5B4:
	lsls r2, r4, #5
	str r5, [sp]
	movs r0, #0
	adds r1, r7, #0
	ldr r3, _080CC5D4 @ =0x085B8D3C
	bl PutSpriteExt
	adds r4, #1
	cmp r4, #7
	ble _080CC5B4
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080CC5D0: .4byte 0x085B8D34
_080CC5D4: .4byte 0x085B8D3C

