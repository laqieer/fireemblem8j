	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set SetBlendConfig, 0x08001DF0 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_807069C, "ax", %progbits
@ sub_807069C @ JP 0x0807069C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807069C
	.thumb_func
sub_807069C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r0, _080706FC @ =0x08603980
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _08070700 @ =0x080E48DA
	str r0, [r5, #0x48]
	ldr r0, _08070704 @ =0x08603998
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08070708 @ =0x086039CC
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _0807070C @ =0x0877F634
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	movs r0, #1
	movs r1, #0xb
	movs r2, #7
	movs r3, #0
	bl SetBlendConfig
	ldr r0, _08070710 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _0807071E
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08070714
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
	b _0807071E
	.align 2, 0
_080706FC: .4byte 0x08603980
_08070700: .4byte 0x080E48DA
_08070704: .4byte 0x08603998
_08070708: .4byte 0x086039CC
_0807070C: .4byte 0x0877F634
_08070710: .4byte 0x0203E11C
_08070714:
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
_0807071E:
	pop {r4, r5}
	pop {r0}
	bx r0

