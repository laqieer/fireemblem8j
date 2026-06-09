	.syntax unified
	.set GetObstacleHpAt, 0x0802E3E4 + 1
	.set PutDigits, 0x080131F0 + 1
	.set PutText, 0x08003DA0 + 1
	.set j_TmApplyTsa, 0x080DC0DC + 1
	.set j_TmFillRect, 0x080DC0E4 + 1
	.set sub_800382C, 0x0800382C + 1
	.set sub_8003CF8, 0x08003CF8 + 1
	.set sub_8003D98, 0x08003D98 + 1
	.set sub_8003EAC, 0x08003EAC + 1
	.set sub_8003F28, 0x08003F28 + 1
	.set sub_8019F18, 0x08019F18 + 1
	.section .text.sub_808EC60, "ax", %progbits
@ sub_808EC60 @ JP 0x0808EC60 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808EC60
	.thumb_func
sub_808EC60:
	push {r4, r5, r6, r7, lr}
	mov r7, sb
	mov r6, r8
	push {r6, r7}
	adds r4, r0, #0
	ldr r0, _0808ED44 @ =0x0202BCAC
	mov sb, r0
	movs r1, #0x16
	ldrsh r0, [r0, r1]
	ldr r1, _0808ED48 @ =0x0202E4D8
	ldr r1, [r1]
	lsls r0, r0, #2
	adds r0, r0, r1
	mov r2, sb
	movs r3, #0x14
	ldrsh r1, [r2, r3]
	ldr r0, [r0]
	adds r0, r0, r1
	ldrb r7, [r0]
	ldr r0, _0808ED4C @ =0x02003FAC
	mov r8, r0
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	ldr r0, _0808ED50 @ =0x020044AC
	movs r1, #0xe
	movs r2, #7
	movs r3, #0
	bl j_TmFillRect
	adds r0, r7, #0
	bl sub_8019F18
	adds r5, r0, #0
	movs r0, #0x28
	adds r1, r5, #0
	bl sub_8003EAC
	adds r6, r0, #0
	adds r4, #0x2c
	adds r0, r4, #0
	bl sub_8003CF8
	adds r0, r4, #0
	adds r1, r6, #0
	movs r2, #0
	bl sub_8003D98
	adds r0, r4, #0
	adds r1, r5, #0
	bl sub_8003F28
	mov r1, r8
	adds r1, #0x82
	adds r0, r4, #0
	bl PutText
	movs r6, #0x81
	lsls r6, r6, #1
	add r6, r8
	ldr r1, _0808ED54 @ =0x08A933D8
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r6, #0
	bl j_TmApplyTsa
	ldr r0, _0808ED58 @ =0x0885FE64
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _0808ED36
	ldr r0, _0808ED5C @ =0x08860A12
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_800382C
	movs r0, #0x85
	lsls r0, r0, #1
	add r0, r8
	ldr r4, _0808ED60 @ =0x02028E4B
	ldr r5, _0808ED64 @ =0x00002128
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
	ldr r0, _0808ED68 @ =0x088609D1
	adds r0, r7, r0
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	bl sub_800382C
	movs r0, #0xa5
	lsls r0, r0, #1
	add r0, r8
	adds r1, r4, #0
	adds r2, r5, #0
	movs r3, #2
	bl PutDigits
_0808ED36:
	cmp r7, #0x29
	bgt _0808ED6C
	cmp r7, #0x27
	bge _0808EDD4
	cmp r7, #0x1b
	beq _0808ED70
	b _0808EE02
	.align 2, 0
_0808ED44: .4byte 0x0202BCAC
_0808ED48: .4byte 0x0202E4D8
_0808ED4C: .4byte 0x02003FAC
_0808ED50: .4byte 0x020044AC
_0808ED54: .4byte 0x08A933D8
_0808ED58: .4byte 0x0885FE64
_0808ED5C: .4byte 0x08860A12
_0808ED60: .4byte 0x02028E4B
_0808ED64: .4byte 0x00002128
_0808ED68: .4byte 0x088609D1
_0808ED6C:
	cmp r7, #0x33
	bne _0808EE02
_0808ED70:
	ldr r4, _0808EDA4 @ =0x020040AE
	ldr r1, _0808EDA8 @ =0x08A933F0
	movs r2, #0x84
	lsls r2, r2, #6
	adds r0, r4, #0
	bl j_TmApplyTsa
	ldr r1, _0808EDAC @ =0x0202BCAC
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl GetObstacleHpAt
	adds r6, r0, #0
	cmp r6, #0x64
	bne _0808EDB4
	adds r0, r4, #0
	adds r0, #0x46
	ldr r1, _0808EDB0 @ =0x08A93400
	movs r2, #0x80
	lsls r2, r2, #1
	bl j_TmApplyTsa
	b _0808EE02
	.align 2, 0
_0808EDA4: .4byte 0x020040AE
_0808EDA8: .4byte 0x08A933F0
_0808EDAC: .4byte 0x0202BCAC
_0808EDB0: .4byte 0x08A93400
_0808EDB4:
	adds r0, r6, #0
	bl sub_800382C
	adds r0, r4, #0
	adds r0, #0x48
	ldr r1, _0808EDCC @ =0x02028E4B
	ldr r2, _0808EDD0 @ =0x00002128
	movs r3, #2
	bl PutDigits
	b _0808EE02
	.align 2, 0
_0808EDCC: .4byte 0x02028E4B
_0808EDD0: .4byte 0x00002128
_0808EDD4:
	ldr r1, _0808EE1C @ =0x08A933E8
	movs r2, #0x80
	lsls r2, r2, #1
	adds r0, r6, #0
	bl j_TmApplyTsa
	mov r1, sb
	movs r2, #0x14
	ldrsh r0, [r1, r2]
	movs r3, #0x16
	ldrsh r1, [r1, r3]
	bl GetObstacleHpAt
	bl sub_800382C
	movs r0, #0x85
	lsls r0, r0, #1
	add r0, r8
	ldr r1, _0808EE20 @ =0x02028E4B
	ldr r2, _0808EE24 @ =0x00002128
	movs r3, #2
	bl PutDigits
_0808EE02:
	ldr r0, _0808EE28 @ =0x020044EC
	ldr r1, _0808EE2C @ =0x08A93178
	movs r2, #0x80
	lsls r2, r2, #5
	bl j_TmApplyTsa
	pop {r3, r4}
	mov r8, r3
	mov sb, r4
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0808EE1C: .4byte 0x08A933E8
_0808EE20: .4byte 0x02028E4B
_0808EE24: .4byte 0x00002128
_0808EE28: .4byte 0x020044EC
_0808EE2C: .4byte 0x08A93178

