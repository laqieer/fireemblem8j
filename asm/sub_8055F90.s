	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set EfxTmCpyBG, 0x080733B8 + 1
	.set sub_80011D0, 0x080011D0 + 1
	.set sub_8001EE4, 0x08001EE4 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8056890, 0x08056890 + 1
	.set sub_80737A4, 0x080737A4 + 1
	.set sub_80D6394, 0x080D6394 + 1
	.section .text.sub_8055F90, "ax", %progbits
@ sub_8055F90 @ JP 0x08055F90 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8055F90
	.thumb_func
sub_8055F90:
	push {r4, r5, lr}
	sub sp, #8
	adds r4, r0, #0
	ldr r5, _0805600C @ =0x0201B790
	adds r0, #0x2c
	adds r1, r4, #0
	adds r1, #0x44
	ldr r2, [r4, #0x48]
	bl sub_8056890
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	cmp r0, #0
	blt _08055FD4
	ldr r1, [r4, #0x4c]
	lsls r0, r0, #2
	adds r0, r0, r1
	ldr r0, [r0]
	adds r1, r5, #0
	bl sub_80D6394
	ldr r1, _08056010 @ =0x020244A8
	movs r0, #6
	str r0, [sp]
	movs r0, #0
	str r0, [sp, #4]
	adds r0, r5, #0
	movs r2, #0x1e
	movs r3, #0x14
	bl EfxTmCpyBG
	movs r0, #8
	bl BG_EnableSyncByMask
_08055FD4:
	adds r0, r4, #0
	adds r0, #0x29
	ldrb r0, [r0]
	cmp r0, #2
	bne _08056002
	ldr r0, _08056010 @ =0x020244A8
	ldr r1, _08056014 @ =0x0000601F
	bl sub_80011D0
	movs r0, #8
	bl BG_EnableSyncByMask
	ldr r0, _08056018 @ =0x020228A8
	movs r1, #6
	movs r2, #0xa
	movs r3, #0x10
	bl sub_80737A4
	bl sub_8001EE4
	adds r0, r4, #0
	bl sub_8002DE4
_08056002:
	add sp, #8
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_0805600C: .4byte 0x0201B790
_08056010: .4byte 0x020244A8
_08056014: .4byte 0x0000601F
_08056018: .4byte 0x020228A8

