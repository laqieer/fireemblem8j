	.syntax unified
	.set BG_SetPosition, 0x08001448 + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_8056158, 0x08056158 + 1
	.section .text.sub_8068A78, "ax", %progbits
@ sub_8068A78 @ JP 0x08068A78 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8068A78
	.thumb_func
sub_8068A78:
	push {r4, lr}
	adds r4, r0, #0
	ldr r1, _08068AB4 @ =0x0201774C
	ldr r0, [r1]
	adds r0, #1
	str r0, [r1]
	ldr r0, _08068AB8 @ =0x08601EC4
	movs r1, #3
	bl sub_8002BCC
	adds r1, r0, #0
	str r4, [r1, #0x5c]
	movs r0, #0
	strh r0, [r1, #0x2c]
	str r0, [r1, #0x44]
	ldr r0, _08068ABC @ =0x080E3958
	str r0, [r1, #0x48]
	ldr r0, _08068AC0 @ =0x0203E11C
	movs r2, #0
	ldrsh r0, [r0, r2]
	cmp r0, #0
	beq _08068AD0
	ldr r0, _08068AC4 @ =0x0860205C
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, _08068AC8 @ =0x086020DC
	str r0, [r1, #0x54]
	ldr r0, _08068ACC @ =0x0860215C
	b _08068ADC
	.align 2, 0
_08068AB4: .4byte 0x0201774C
_08068AB8: .4byte 0x08601EC4
_08068ABC: .4byte 0x080E3958
_08068AC0: .4byte 0x0203E11C
_08068AC4: .4byte 0x0860205C
_08068AC8: .4byte 0x086020DC
_08068ACC: .4byte 0x0860215C
_08068AD0:
	ldr r0, _08068AF4 @ =0x08601EDC
	str r0, [r1, #0x4c]
	str r0, [r1, #0x50]
	ldr r0, _08068AF8 @ =0x08601F5C
	str r0, [r1, #0x54]
	ldr r0, _08068AFC @ =0x08601FDC
_08068ADC:
	str r0, [r1, #0x58]
	movs r0, #1
	movs r1, #0
	movs r2, #0
	bl BG_SetPosition
	bl sub_8056158
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08068AF4: .4byte 0x08601EDC
_08068AF8: .4byte 0x08601F5C
_08068AFC: .4byte 0x08601FDC

