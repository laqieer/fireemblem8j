	.syntax unified
	.set sub_8012CEC, 0x08012CEC + 1
	.set EndEventEarthQuake, 0x08012D40 + 1
	.section .text.sub_8010D9C, "ax", %progbits
@ sub_8010D9C @ JP 0x08010D9C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8010D9C
	.thumb_func
sub_8010D9C:
	push {r4, r5, lr}
	adds r2, r0, #0
	ldr r0, [r2, #0x38]
	ldrb r1, [r0]
	movs r3, #0xf
	ands r3, r1
	ldrh r1, [r0, #2]
	ldrb r5, [r0, #2]
	lsls r1, r1, #0x10
	asrs r4, r1, #0x18
	cmp r3, #0
	beq _08010DBA
	cmp r3, #0xf
	beq _08010E10
	b _08010E14
_08010DBA:
	ldrh r0, [r2, #0x3c]
	lsrs r0, r0, #2
	movs r1, #1
	ands r0, r1
	cmp r0, #0
	bne _08010E14
	adds r0, r2, #0
	adds r0, #0x42
	ldrb r0, [r0]
	cmp r0, #5
	bhi _08010E04
	lsls r0, r0, #2
	ldr r1, _08010DDC @ =_08010DE0
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08010DDC: .4byte _08010DE0
_08010DE0: @ jump table
	.4byte _08010DF8 @ case 0
	.4byte _08010DFC @ case 1
	.4byte _08010E00 @ case 2
	.4byte _08010DF8 @ case 3
	.4byte _08010DF8 @ case 4
	.4byte _08010E00 @ case 5
_08010DF8:
	movs r3, #0
	b _08010E04
_08010DFC:
	movs r3, #1
	b _08010E04
_08010E00:
	movs r0, #6
	b _08010E16
_08010E04:
	adds r0, r3, #0
	adds r1, r5, #0
	adds r2, r4, #0
	bl sub_8012CEC
	b _08010E14
_08010E10:
	bl EndEventEarthQuake
_08010E14:
	movs r0, #0
_08010E16:
	pop {r4, r5}
	pop {r1}
	bx r1

