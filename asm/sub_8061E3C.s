	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set GetAnimPosition, 0x0805AF10 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.set sub_80567E0, 0x080567E0 + 1
	.section .text.sub_8061E3C, "ax", %progbits
@ sub_8061E3C @ JP 0x08061E3C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8061E3C
	.thumb_func
sub_8061E3C:
	push {r4, r5, lr}
	adds r4, r0, #0
	ldr r1, _08061E98 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08061E9C @ =0x08600954
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	movs r1, #0
	strh r1, [r5, #0x2c]
	str r1, [r5, #0x44]
	ldr r0, _08061EA0 @ =0x080E1DE6
	str r0, [r5, #0x48]
	ldr r0, _08061EA4 @ =0x085FF84C
	str r0, [r5, #0x4c]
	str r0, [r5, #0x50]
	ldr r0, _08061EA8 @ =0x085FF7F8
	str r0, [r5, #0x54]
	str r1, [r5, #0x58]
	ldr r0, _08061EAC @ =0x086834EC
	movs r1, #0x20
	bl sub_80567E0
	bl sub_8056158
	ldr r0, _08061EB0 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	beq _08061EBE
	ldr r0, [r5, #0x5c]
	bl GetAnimPosition
	cmp r0, #0
	bne _08061EB4
	movs r0, #1
	movs r1, #0x18
	movs r2, #0
	bl BG_SetPosition
	b _08061EBE
	.align 2, 0
_08061E98: .4byte 0x0201774C
_08061E9C: .4byte 0x08600954
_08061EA0: .4byte 0x080E1DE6
_08061EA4: .4byte 0x085FF84C
_08061EA8: .4byte 0x085FF7F8
_08061EAC: .4byte 0x086834EC
_08061EB0: .4byte 0x0203E11C
_08061EB4:
	movs r0, #1
	movs r1, #0xe8
	movs r2, #0
	bl BG_SetPosition
_08061EBE:
	pop {r4, r5}
	pop {r0}
	bx r0

