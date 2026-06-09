	.syntax unified
	.set SetFlag, 0x080860A8 + 1
	.set sub_8037FDC, 0x08037FDC + 1
	.section .text.sub_8037D38, "ax", %progbits
@ sub_8037D38 @ JP 0x08037D38 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037D38
	.thumb_func
sub_8037D38:
	push {r4, lr}
	ldr r4, _08037D88 @ =0x03001798
	adds r0, r4, #0
	bl sub_8037FDC
	ldr r0, _08037D8C @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08037D82
	adds r0, r4, #0
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #0
	bne _08037D68
	ldr r0, [r4, #8]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	cmp r0, #0xc7
	ble _08037D68
	movs r0, #0x6b
	bl SetFlag
_08037D68:
	ldr r0, _08037D88 @ =0x03001798
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _08037D82
	ldr r0, [r4, #8]
	lsls r0, r0, #0xc
	lsrs r0, r0, #0x16
	cmp r0, #0xc7
	ble _08037D82
	movs r0, #0x6c
	bl SetFlag
_08037D82:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037D88: .4byte 0x03001798
_08037D8C: .4byte 0x0202BCEC

