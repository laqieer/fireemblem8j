	.syntax unified
	.set InvalidateSuspendSave, 0x080AA438 + 1
	.set IsValidSuspendSave, 0x080AA7C0 + 1
	.set ReadSuspendSavePlaySt, 0x080AA814 + 1
	.set sub_80D65C8, 0x080D65C8 + 1
	.section .text.sub_80AB4B8, "ax", %progbits
@ sub_80AB4B8 @ JP 0x080AB4B8 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80AB4B8
	.thumb_func
sub_80AB4B8:
	push {r4, lr}
	sub sp, #0x4c
	movs r0, #3
	bl IsValidSuspendSave
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _080AB500
	movs r0, #3
	mov r1, sp
	bl ReadSuspendSavePlaySt
	mov r0, sp
	ldrb r0, [r0, #0xe]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #0x7f
	bne _080AB500
	ldr r1, _080AB508 @ =0x03006790
	ldr r0, _080AB50C @ =0x08A9CA5C
	ldr r0, [r0]
	ldr r4, _080AB510 @ =0x0203EF40
	ldr r3, [r1]
	adds r1, r4, #0
	movs r2, #0x1c
	bl sub_80D65C8
	ldr r0, [sp, #0x2c]
	lsls r0, r0, #9
	lsrs r0, r0, #0x16
	ldrb r4, [r4, #0xf]
	cmp r0, r4
	beq _080AB500
	movs r0, #3
	bl InvalidateSuspendSave
_080AB500:
	add sp, #0x4c
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080AB508: .4byte 0x03006790
_080AB50C: .4byte 0x08A9CA5C
_080AB510: .4byte 0x0203EF40

