	.syntax unified
	.set BG_EnableSyncByMask, 0x08001EFC + 1
	.set __umodsi3, 0x080D6848 + 1
	.set sub_8005544, 0x08005544 + 1
	.set sub_80A793C, 0x080A793C + 1
	.section .text.sub_801BD8C, "ax", %progbits
@ sub_801BD8C @ JP 0x0801BD8C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_801BD8C
	.thumb_func
sub_801BD8C:
	push {lr}
	sub sp, #0x14
	ldr r0, [r0, #0x48]
	adds r0, #0x3c
	movs r1, #0
	strb r1, [r0]
	movs r0, #1
	bl BG_EnableSyncByMask
	add r0, sp, #4
	movs r1, #3
	bl sub_80A793C
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r0, #1
	bne _0801BDBC
	ldr r2, [sp, #0x10]
	lsrs r0, r2, #0x10
	adds r0, r2, r0
	movs r1, #0xf
	ands r0, r1
	cmp r0, #0
	beq _0801BDDC
_0801BDBC:
	ldr r0, _0801BDD8 @ =0x00000103
	str r0, [sp]
	movs r0, #0
	movs r1, #0x14
	movs r2, #0x20
	movs r3, #0x50
	bl sub_8005544
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
	movs r1, #2
	b _0801BE12
	.align 2, 0
_0801BDD8: .4byte 0x00000103
_0801BDDC:
	movs r0, #0xff
	ands r2, r0
	adds r0, r2, #0
	movs r1, #0x65
	bl __umodsi3
	adds r1, r0, #1
	ldr r0, _0801BE24 @ =0x00000103
	str r0, [sp]
	movs r0, #0
	movs r2, #0x20
	movs r3, #0x50
	bl sub_8005544
	ldr r0, [sp, #0x10]
	movs r1, #0xff
	lsls r1, r1, #8
	ands r0, r1
	lsrs r0, r0, #8
	movs r1, #0x65
	bl __umodsi3
	adds r1, r0, #1
	movs r0, #0x81
	lsls r0, r0, #1
	str r0, [sp]
	movs r0, #1
_0801BE12:
	movs r2, #0xd0
	movs r3, #0x50
	bl sub_8005544
	movs r0, #0
	add sp, #0x14
	pop {r1}
	bx r1
	.align 2, 0
_0801BE24: .4byte 0x00000103

