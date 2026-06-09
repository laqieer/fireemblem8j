	.syntax unified
	.set EkrGauge_Clr323A, 0x08051F04 + 1
	.set EkrGauge_ClrInitFlag, 0x08051F3C + 1
	.set sub_8002BCC, 0x08002BCC + 1
	.section .text.sub_8057CAC, "ax", %progbits
@ sub_8057CAC @ JP 0x08057CAC - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8057CAC
	.thumb_func
sub_8057CAC:
	push {r4, r5, lr}
	adds r5, r0, #0
	adds r4, r1, #0
	ldr r0, _08057CF0 @ =0x085E3F3C
	movs r1, #3
	bl sub_8002BCC
	str r5, [r0, #0x44]
	movs r1, #0
	strh r1, [r0, #0x2c]
	strh r4, [r0, #0x2e]
	movs r1, #0x39
	strh r1, [r0, #0x30]
	movs r2, #0
	cmp r5, #0
	bne _08057CCE
	movs r2, #0x39
_08057CCE:
	ldr r1, _08057CF4 @ =0x02000038
	movs r3, #0
	ldrsh r0, [r1, r3]
	ldrh r1, [r1, #2]
	adds r1, r1, r2
	lsls r1, r1, #0x10
	asrs r1, r1, #0x10
	bl EkrGauge_Clr323A
	ldr r1, _08057CF8 @ =0x0201FACC
	movs r0, #1
	str r0, [r1]
	bl EkrGauge_ClrInitFlag
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08057CF0: .4byte 0x085E3F3C
_08057CF4: .4byte 0x02000038
_08057CF8: .4byte 0x0201FACC

