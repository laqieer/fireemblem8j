	.syntax unified
	.set sub_80194BC, 0x080194BC + 1
	.set sub_801D6FC, 0x0801D6FC + 1
	.set sub_807C44C, 0x0807C44C + 1
	.set sub_8085680, 0x08085680 + 1
	.set sub_80976FC, 0x080976FC + 1
	.section .text.sub_80331E0, "ax", %progbits
@ sub_80331E0 @ JP 0x080331E0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80331E0
	.thumb_func
sub_80331E0:
	push {r4, r5, lr}
	sub sp, #4
	bl sub_8085680
	adds r4, r0, #0
	ldr r0, _08033254 @ =0x0202E4E0
	ldr r0, [r0]
	movs r1, #0
	bl sub_80194BC
	ldr r0, _08033258 @ =0x0202E4DC
	ldr r0, [r0]
	movs r1, #1
	rsbs r1, r1, #0
	bl sub_80194BC
	bl sub_80976FC
	lsls r1, r0, #2
	adds r1, r1, r0
	lsls r1, r1, #2
	adds r4, r4, r1
	ldrb r0, [r4]
	cmp r0, #0
	beq _08033244
	mov r5, sp
	adds r5, #1
_08033216:
	adds r0, r4, #0
	mov r1, sp
	adds r2, r5, #0
	movs r3, #0
	bl sub_807C44C
	movs r1, #0
	ldrsb r1, [r5, r1]
	ldr r0, _08033254 @ =0x0202E4E0
	ldr r0, [r0]
	lsls r1, r1, #2
	adds r1, r1, r0
	mov r0, sp
	movs r2, #0
	ldrsb r2, [r0, r2]
	ldr r0, [r1]
	adds r0, r0, r2
	movs r1, #1
	strb r1, [r0]
	adds r4, #0x14
	ldrb r0, [r4]
	cmp r0, #0
	bne _08033216
_08033244:
	movs r0, #0x10
	bl sub_801D6FC
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08033254: .4byte 0x0202E4E0
_08033258: .4byte 0x0202E4DC

