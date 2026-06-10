	.syntax unified
	.set sub_8015BF0, 0x08015BF0 + 1
	.section .text.sub_8036FA8, "ax", %progbits
@ sub_8036FA8 @ JP 0x08036FA8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8036FA8
	.thumb_func
sub_8036FA8:
	push {r4, r5, r6, lr}
	adds r4, r0, #0
	movs r6, #0
	movs r5, #0
	ldr r0, _08037044 @ =0x0203A4E8
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08036FC0
	movs r6, #1
_08036FC0:
	cmp r0, #0
	bge _08036FC6
	movs r6, #2
_08036FC6:
	ldr r0, _08037048 @ =0x0203A568
	adds r0, #0x53
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0
	ble _08036FD6
	movs r5, #1
_08036FD6:
	cmp r0, #0
	bge _08036FDC
	movs r5, #2
_08036FDC:
	cmp r5, #0
	beq _0803700C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #8
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #0xb
	lsls r1, r0, #3
	movs r2, #0
	cmp r5, #2
	bne _08037006
	movs r2, #1
_08037006:
	adds r0, r3, #0
	bl sub_8015BF0
_0803700C:
	cmp r6, #0
	beq _0803703C
	adds r0, r4, #0
	adds r0, #0x30
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #2
	lsls r0, r0, #3
	adds r3, r0, #3
	adds r0, r4, #0
	adds r0, #0x31
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	adds r0, #1
	lsls r1, r0, #3
	movs r2, #0
	cmp r6, #2
	bne _08037036
	movs r2, #1
_08037036:
	adds r0, r3, #0
	bl sub_8015BF0
_0803703C:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_08037044: .4byte 0x0203A4E8
_08037048: .4byte 0x0203A568

