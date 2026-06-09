	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set SetBlendTargetB, 0x08001E5C + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.section .text.sub_80ACBD0, "ax", %progbits
@ sub_80ACBD0 @ JP 0x080ACBD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80ACBD0
	.thumb_func
sub_80ACBD0:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080ACC34 @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080ACBE8
	movs r0, #0x79
	bl m4aSongNumStart
_080ACBE8:
	movs r4, #0
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetA
	movs r0, #1
	str r0, [sp]
	movs r1, #1
	movs r2, #1
	movs r3, #1
	bl SetBlendTargetB
	movs r0, #3
	movs r1, #0x10
	movs r2, #0
	movs r3, #4
	bl SetBlendConfig
	ldr r0, _080ACC38 @ =0x02000500
	ldr r1, _080ACC3C @ =0x02000280
	str r1, [r0]
	ldr r2, _080ACC40 @ =0x02000504
	ldr r3, _080ACC44 @ =0xFFFFFD80
	adds r0, r1, r3
	str r0, [r2]
	ldr r0, _080ACC48 @ =0x02000508
	str r1, [r0]
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080ACC34: .4byte 0x0202BCEC
_080ACC38: .4byte 0x02000500
_080ACC3C: .4byte 0x02000280
_080ACC40: .4byte 0x02000504
_080ACC44: .4byte 0xFFFFFD80
_080ACC48: .4byte 0x02000508

