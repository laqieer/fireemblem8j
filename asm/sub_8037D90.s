	.syntax unified
	.set SetFlag, 0x080860A8 + 1
	.set UpdateDungeonRecordStats, 0x080380F8 + 1
	.set sub_8037D38, 0x08037D38 + 1
	.section .text.sub_8037D90, "ax", %progbits
@ sub_8037D90 @ JP 0x08037D90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8037D90
	.thumb_func
sub_8037D90:
	push {r4, lr}
	bl sub_8037D38
	bl UpdateDungeonRecordStats
	ldr r0, _08037DE8 @ =0x0202BCEC
	ldrb r1, [r0, #0x14]
	movs r0, #4
	ands r0, r1
	cmp r0, #0
	beq _08037DE2
	ldr r1, _08037DEC @ =0x03001798
	adds r0, r1, #0
	adds r0, #0x24
	ldrb r2, [r0]
	lsls r0, r2, #1
	adds r0, r0, r2
	lsls r0, r0, #2
	adds r1, #0xc
	adds r4, r0, r1
	cmp r2, #0
	bne _08037DCA
	ldrb r0, [r4, #0xa]
	lsrs r0, r0, #4
	cmp r0, #2
	ble _08037DCA
	movs r0, #0x6f
	bl SetFlag
_08037DCA:
	ldr r0, _08037DEC @ =0x03001798
	adds r0, #0x24
	ldrb r0, [r0]
	cmp r0, #1
	bne _08037DE2
	ldrb r0, [r4, #0xa]
	lsrs r0, r0, #4
	cmp r0, #2
	ble _08037DE2
	movs r0, #0x70
	bl SetFlag
_08037DE2:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08037DE8: .4byte 0x0202BCEC
_08037DEC: .4byte 0x03001798

