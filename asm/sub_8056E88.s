	.syntax unified
	.set EkrDispUpSet4C, 0x08052820 + 1
	.set EkrDispUpSet50, 0x08052830 + 1
	.set EkrGauge_Set4C, 0x08051ED4 + 1
	.set EkrGauge_Set50, 0x08051EE4 + 1
	.set NewEkrNamewinAppear, 0x08057D98 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8051C2C, 0x08051C2C + 1
	.set sub_80527BC, 0x080527BC + 1
	.set sub_80529BC, 0x080529BC + 1
	.set sub_8057424, 0x08057424 + 1
	.set sub_8057888, 0x08057888 + 1
	.set sub_8057CAC, 0x08057CAC + 1
	.set sub_8057EA8, 0x08057EA8 + 1
	.section .text.sub_8056E88, "ax", %progbits
@ sub_8056E88 @ JP 0x08056E88 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8056E88
	.thumb_func
sub_8056E88:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r0, _08056EB4 @ =0x0203E0F8
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #0
	bne _08056EEC
	bl sub_8051C2C
	bl sub_80527BC
	ldr r0, _08056EB8 @ =0x0203E11C
	movs r1, #0
	ldrsh r0, [r0, r1]
	cmp r0, #3
	beq _08056EBC
	cmp r0, #3
	ble _08056EEC
	cmp r0, #4
	beq _08056EE4
	b _08056EEC
	.align 2, 0
_08056EB4: .4byte 0x0203E0F8
_08056EB8: .4byte 0x0203E11C
_08056EBC:
	ldr r4, _08056EE0 @ =0x0203E100
	movs r1, #0
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08056ECE
	bl EkrGauge_Set4C
	bl EkrDispUpSet4C
_08056ECE:
	movs r1, #2
	ldrsh r0, [r4, r1]
	cmp r0, #0
	bne _08056EEC
	bl EkrGauge_Set50
	bl EkrDispUpSet50
	b _08056EEC
	.align 2, 0
_08056EE0: .4byte 0x0203E100
_08056EE4:
	bl EkrGauge_Set4C
	bl EkrDispUpSet4C
_08056EEC:
	bl sub_80529BC
	movs r0, #0
	bl sub_8057888
	movs r0, #0
	bl sub_8057424
	movs r0, #0
	movs r1, #0xb
	bl sub_8057CAC
	movs r0, #0
	movs r1, #0xb
	movs r2, #0
	bl NewEkrNamewinAppear
	movs r0, #0
	movs r1, #0xb
	bl sub_8057EA8
	movs r0, #0
	strh r0, [r5, #0x2c]
	adds r0, r5, #0
	bl sub_8002DE4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0

