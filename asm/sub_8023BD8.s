	.syntax unified
	.set sub_8016FE4, 0x08016FE4 + 1
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801B13C, 0x0801B13C + 1
	.set sub_801D6FC, 0x0801D6FC + 1
	.set sub_801E3A4, 0x0801E3A4 + 1
	.section .text.sub_8023BD8, "ax", %progbits
@ sub_8023BD8 @ JP 0x08023BD8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8023BD8
	.thumb_func
sub_8023BD8:
	push {r4, r5, r6, lr}
	adds r4, r1, #0
	ldr r5, _08023C20 @ =0x03004DF0
	ldr r0, [r5]
	adds r4, #0x3c
	movs r1, #0
	ldrsb r1, [r4, r1]
	bl sub_8016FE4
	adds r6, r0, #0
	movs r0, #0
	ldrsb r0, [r4, r0]
	bl sub_801E3A4
	ldr r0, _08023C24 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	ldr r0, _08023C28 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, [r5]
	adds r1, r6, #0
	bl sub_801B13C
	movs r0, #4
	bl sub_801D6FC
	movs r0, #0
	pop {r4, r5, r6}
	pop {r1}
	bx r1
	.align 2, 0
_08023C20: .4byte 0x03004DF0
_08023C24: .4byte 0x0202E4DC
_08023C28: .4byte 0x0202E4E0

