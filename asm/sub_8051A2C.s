	.syntax unified
	.set GetEkrDragonStatusType, 0x0807201C + 1
	.set SetEkrDragonExit, 0x08072798 + 1
	.section .text.sub_8051A2C, "ax", %progbits
@ sub_8051A2C @ JP 0x08051A2C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8051A2C
	.thumb_func
sub_8051A2C:
	push {r4, lr}
	adds r4, r0, #0
	ldr r0, [r4, #0x48]
	cmp r0, #2
	bne _08051A40
	ldr r0, _08051A3C @ =sub_8051ADC
	str r0, [r4, #0xc]
	b _08051AB0
	.align 2, 0
_08051A3C: .4byte 0x08051ADD  @ sub_8051ADC
_08051A40:
	ldr r0, [r4, #0x44]
	cmp r0, #0
	bne _08051A7C
	ldr r0, _08051A60 @ =0x02000000
	ldr r0, [r0]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #2
	beq _08051A68
	cmp r0, #2
	bhi _08051A64
	cmp r0, #1
	beq _08051A68
	b _08051A72
	.align 2, 0
_08051A60: .4byte 0x02000000
_08051A64:
	cmp r0, #3
	bne _08051A72
_08051A68:
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonExit
	ldr r0, _08051A78 @ =sub_8051ABC
	str r0, [r4, #0xc]
_08051A72:
	movs r0, #1
	b _08051AA8
	.align 2, 0
_08051A78: .4byte 0x08051ABD  @ sub_8051ABC
_08051A7C:
	ldr r0, _08051A94 @ =0x02000000
	ldr r0, [r0, #8]
	str r0, [r4, #0x5c]
	bl GetEkrDragonStatusType
	cmp r0, #2
	beq _08051A9C
	cmp r0, #2
	bhi _08051A98
	cmp r0, #1
	beq _08051A9C
	b _08051AA6
	.align 2, 0
_08051A94: .4byte 0x02000000
_08051A98:
	cmp r0, #3
	bne _08051AA6
_08051A9C:
	ldr r0, [r4, #0x5c]
	bl SetEkrDragonExit
	ldr r0, _08051AB8 @ =sub_8051ABC
	str r0, [r4, #0xc]
_08051AA6:
	movs r0, #0
_08051AA8:
	str r0, [r4, #0x44]
	ldr r0, [r4, #0x48]
	adds r0, #1
	str r0, [r4, #0x48]
_08051AB0:
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_08051AB8: .4byte 0x08051ABD  @ sub_8051ABC

