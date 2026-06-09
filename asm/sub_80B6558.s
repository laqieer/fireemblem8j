	.syntax unified
	.set CallARM_PushToSecondaryOAM, 0x08002B08 + 1
	.set GetGameOption, 0x080B6A00 + 1
	.set GetSelectedGameOption, 0x080B62EC + 1
	.set UpdateMenuScrollBarConfig, 0x080999B0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_804F528, 0x0804F528 + 1
	.set sub_804F5D4, 0x0804F5D4 + 1
	.set sub_8097C50, 0x08097C50 + 1
	.set sub_80B62FC, 0x080B62FC + 1
	.section .text.sub_80B6558, "ax", %progbits
@ sub_80B6558 @ JP 0x080B6558 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B6558
	.thumb_func
sub_80B6558:
	push {r4, r5, r6, r7, lr}
	ldr r1, _080B6610 @ =0x08AAF6DC
	ldr r6, _080B6614 @ =0x08AAF6D8
	ldr r0, [r6]
	movs r2, #0x2a
	ldrsh r0, [r0, r2]
	adds r0, r0, r1
	ldrb r5, [r0]
	bl sub_8000CD8
	movs r1, #0xf
	ands r0, r1
	movs r1, #8
	ands r0, r1
	lsls r0, r0, #0x18
	lsrs r7, r0, #0x18
	ldr r2, _080B6618 @ =0x08AAF6EA
	movs r3, #0x83
	lsls r3, r3, #6
	movs r0, #0x12
	movs r1, #8
	bl CallARM_PushToSecondaryOAM
	ldr r0, [r6]
	movs r1, #0x2a
	ldrsh r4, [r0, r1]
	movs r2, #0x2c
	ldrsh r0, [r0, r2]
	subs r4, r4, r0
	lsls r4, r4, #4
	adds r4, #0x28
	movs r0, #0x10
	adds r1, r4, #0
	bl sub_804F5D4
	adds r0, r5, #0
	bl GetGameOption
	ldr r2, _080B661C @ =0x08AAF700
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x15
	movs r1, #0x2c
	muls r1, r5, r1
	adds r0, r0, r1
	adds r0, r0, r2
	ldrb r0, [r0, #8]
	subs r0, #2
	adds r1, r4, #0
	bl sub_804F528
	ldr r0, [r6]
	adds r0, #0x37
	ldrb r1, [r0]
	movs r0, #1
	ands r0, r1
	cmp r0, #0
	beq _080B65D2
	bl sub_8097C50
	cmp r0, #0
	beq _080B65FA
_080B65D2:
	bl GetSelectedGameOption
	lsls r0, r0, #0x18
	cmp r0, #0
	bne _080B65FA
	bl sub_80B62FC
	lsls r0, r0, #0x18
	lsrs r0, r0, #0x18
	cmp r0, #3
	bne _080B65FA
	ldr r2, _080B6620 @ =0x085B8CE4
	ldr r3, _080B6624 @ =0x000020CC
	cmp r7, #0
	beq _080B65F2
	adds r3, #2
_080B65F2:
	movs r0, #0xc0
	movs r1, #0x28
	bl CallARM_PushToSecondaryOAM
_080B65FA:
	ldr r0, _080B6614 @ =0x08AAF6D8
	ldr r0, [r0]
	ldrh r1, [r0, #0x2e]
	ldrh r2, [r0, #0x34]
	movs r0, #0xa
	movs r3, #6
	bl UpdateMenuScrollBarConfig
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_080B6610: .4byte 0x08AAF6DC
_080B6614: .4byte 0x08AAF6D8
_080B6618: .4byte 0x08AAF6EA
_080B661C: .4byte 0x08AAF700
_080B6620: .4byte 0x085B8CE4
_080B6624: .4byte 0x000020CC

