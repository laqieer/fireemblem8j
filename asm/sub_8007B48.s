	.syntax unified
	.set CheckTalkFlag, 0x080069E0 + 1
	.set PutSprite, 0x080052F0 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_8007B48, "ax", %progbits
@ sub_8007B48 @ JP 0x08007B48 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8007B48
	.thumb_func
sub_8007B48:
	push {r4, r5, lr}
	sub sp, #4
	adds r5, r0, #0
	bl sub_8000CD8
	lsrs r4, r0, #1
	movs r0, #0xf
	ands r4, r0
	movs r0, #0x80
	bl CheckTalkFlag
	cmp r0, #0
	bne _08007B88
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _08007B84 @ =0x085B91C8
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	movs r0, #4
	str r0, [sp]
	movs r0, #2
	bl PutSprite
	b _08007BA8
	.align 2, 0
_08007B84: .4byte 0x085B91C8
_08007B88:
	adds r0, r5, #0
	adds r0, #0x64
	movs r2, #0
	ldrsh r1, [r0, r2]
	adds r0, #2
	movs r3, #0
	ldrsh r2, [r0, r3]
	ldr r3, _08007BC4 @ =0x085B91C8
	lsls r0, r4, #2
	adds r0, r0, r3
	ldr r3, [r0]
	ldr r0, _08007BC8 @ =0x0000B2BF
	str r0, [sp]
	movs r0, #0
	bl PutSprite
_08007BA8:
	ldr r0, _08007BCC @ =0x085775CC
	ldr r0, [r0]
	ldrh r1, [r0, #8]
	movs r0, #0xf3
	ands r0, r1
	cmp r0, #0
	beq _08007BBC
	adds r0, r5, #0
	bl sub_8002DE4
_08007BBC:
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08007BC4: .4byte 0x085B91C8
_08007BC8: .4byte 0x0000B2BF
_08007BCC: .4byte 0x085775CC

