	.syntax unified
	.set SetBlendBackdropA, 0x08001E98 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set SetBlendTargetA, 0x08001E20 + 1
	.set m4aSongNumStart, 0x080D4EF4 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80C57B8, 0x080C57B8 + 1
	.section .text.sub_80C5CCC, "ax", %progbits
@ sub_80C5CCC @ JP 0x080C5CCC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80C5CCC
	.thumb_func
sub_80C5CCC:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	ldr r0, _080C5CF0 @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0x80
	lsls r0, r0, #1
	ands r0, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	cmp r4, #0
	beq _080C5CF4
	adds r0, r5, #0
	bl sub_80C57B8
	b _080C5D5A
	.align 2, 0
_080C5CF0: .4byte 0x085775CC
_080C5CF4:
	movs r0, #2
	ands r0, r1
	cmp r0, #0
	beq _080C5D5A
	ldr r2, _080C5D64 @ =0x03003020
	ldrb r1, [r2, #1]
	movs r0, #2
	rsbs r0, r0, #0
	ands r0, r1
	movs r1, #3
	rsbs r1, r1, #0
	ands r0, r1
	subs r1, #2
	ands r0, r1
	subs r1, #4
	ands r0, r1
	subs r1, #8
	ands r0, r1
	strb r0, [r2, #1]
	movs r0, #3
	movs r1, #0
	movs r2, #0
	movs r3, #0x10
	bl SetBlendConfig
	str r4, [sp]
	movs r0, #0
	movs r1, #0
	movs r2, #0
	movs r3, #0
	bl SetBlendTargetA
	movs r0, #1
	bl SetBlendBackdropA
	ldr r0, _080C5D68 @ =0x020228A8
	strh r4, [r0]
	bl sub_8001EE4
	adds r0, r5, #0
	bl sub_8002DE4
	ldr r0, _080C5D6C @ =0x0202BCEC
	adds r0, #0x41
	ldrb r0, [r0]
	lsls r0, r0, #0x1e
	cmp r0, #0
	blt _080C5D5A
	movs r0, #0x6b
	bl m4aSongNumStart
_080C5D5A:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080C5D64: .4byte 0x03003020
_080C5D68: .4byte 0x020228A8
_080C5D6C: .4byte 0x0202BCEC

