	.syntax unified
	.set StartEventWarpAnim_ret, 0x08012A14 + 1
	.set sub_8012A38, 0x08012A38 + 1
	.section .text.sub_8010D24, "ax", %progbits
@ sub_8010D24 @ JP 0x08010D24 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010D24
	.thumb_func
sub_8010D24:
	push {r4, r5, r6, lr}
	sub sp, #4
	adds r5, r0, #0
	ldrh r6, [r5, #0x3c]
	lsrs r4, r6, #2
	movs r0, #1
	ands r4, r0
	cmp r4, #0
	beq _08010D3A
	movs r0, #0
	b _08010D94
_08010D3A:
	ldr r2, [r5, #0x38]
	ldrb r0, [r2]
	movs r3, #0xf
	ands r3, r0
	cmp r3, #0
	blt _08010D92
	cmp r3, #1
	ble _08010D50
	cmp r3, #0xf
	beq _08010D82
	b _08010D92
_08010D50:
	ldrb r2, [r2, #2]
	lsls r2, r2, #0x18
	asrs r2, r2, #0x18
	adds r1, r2, #0
	cmp r2, #0
	bge _08010D66
	ldr r0, _08010D74 @ =0x030004DC
	movs r1, #0
	ldrsb r1, [r0, r1]
	movs r2, #2
	ldrsb r2, [r0, r2]
_08010D66:
	movs r0, #0x40
	ands r0, r6
	cmp r0, #0
	bne _08010D78
	movs r0, #1
	str r0, [sp]
	b _08010D7A
	.align 2, 0
_08010D74: .4byte 0x030004DC
_08010D78:
	str r4, [sp]
_08010D7A:
	adds r0, r5, #0
	bl StartEventWarpAnim_ret
	b _08010D92
_08010D82:
	bl sub_8012A38
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _08010D92
	movs r0, #3
	b _08010D94
_08010D92:
	movs r0, #2
_08010D94:
	add sp, #4
	pop {r4, r5, r6}
	pop {r1}
	bx r1

