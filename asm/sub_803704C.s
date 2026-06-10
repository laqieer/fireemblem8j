	.syntax unified
	.set PutSprite, 0x080052F0 + 1
	.section .text.sub_803704C, "ax", %progbits
@ sub_803704C @ JP 0x0803704C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_803704C
	.thumb_func
sub_803704C:
	push {r4, r5, r6, r7, lr}
	sub sp, #4
	adds r7, r0, #0
	ldr r1, [r7, #0x2c]
	lsls r1, r1, #2
	movs r0, #0xff
	ldr r2, _080370DC @ =0x080DC15C
	ands r1, r0
	lsls r0, r1, #1
	adds r0, r0, r2
	movs r3, #0
	ldrsh r0, [r0, r3]
	asrs r6, r0, #0xa
	adds r1, #0x40
	lsls r1, r1, #1
	adds r1, r1, r2
	movs r4, #0
	ldrsh r0, [r1, r4]
	asrs r5, r0, #0xb
	subs r1, r6, #3
	adds r0, r7, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r6, r1, r0
	adds r0, r7, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	lsls r0, r0, #3
	adds r5, r5, r0
	adds r4, r7, #0
	adds r4, #0x50
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble _080370B2
	adds r1, r6, #0
	adds r1, #0x48
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, _080370E0 @ =0x085B8CE4
	ldr r4, _080370E4 @ =0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
_080370B2:
	adds r4, r7, #0
	adds r4, #0x51
	movs r0, #0
	ldrsb r0, [r4, r0]
	cmp r0, #1
	ble _080370D4
	adds r1, r6, #0
	adds r1, #0x18
	adds r2, r5, #0
	adds r2, #0x28
	ldr r3, _080370E0 @ =0x085B8CE4
	ldr r4, _080370E4 @ =0x000022E6
	adds r0, r0, r4
	str r0, [sp]
	movs r0, #4
	bl PutSprite
_080370D4:
	add sp, #4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080370DC: .4byte 0x080DC15C
_080370E0: .4byte 0x085B8CE4
_080370E4: .4byte 0x000022E6

