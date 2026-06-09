	.syntax unified
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8000CD8, 0x08000CD8 + 1
	.set sub_80D636C, 0x080D636C + 1
	.section .text.sub_8026ED0, "ax", %progbits
@ sub_8026ED0 @ JP 0x08026ED0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8026ED0
	.thumb_func
sub_8026ED0:
	push {r4, r5, lr}
	bl sub_8000CD8
	movs r1, #0x48
	bl __umodsi3
	adds r4, r0, #0
	adds r5, r4, #0
	cmp r4, #0
	bne _08026EF0
	ldr r0, _08026F28 @ =0x0203400C
	ldr r1, _08026F2C @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_80D636C
_08026EF0:
	cmp r4, #0x20
	bne _08026F00
	ldr r0, _08026F30 @ =0x0203600C
	ldr r1, _08026F2C @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_80D636C
_08026F00:
	cmp r4, #0x24
	bne _08026F10
	ldr r0, _08026F34 @ =0x0203800C
	ldr r1, _08026F2C @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_80D636C
_08026F10:
	cmp r5, #0x44
	bne _08026F20
	ldr r0, _08026F30 @ =0x0203600C
	ldr r1, _08026F2C @ =0x06011000
	movs r2, #0x80
	lsls r2, r2, #4
	bl sub_80D636C
_08026F20:
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08026F28: .4byte 0x0203400C
_08026F2C: .4byte 0x06011000
_08026F30: .4byte 0x0203600C
_08026F34: .4byte 0x0203800C

