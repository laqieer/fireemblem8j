	.syntax unified
	.set GetMu, 0x0807BFA4 + 1
	.set sub_80D6370, 0x080D6370 + 1
	.section .text.sub_807BFF4, "ax", %progbits
@ SortMus @ JP 0x0807BFF4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SortMus
	.thumb_func
SortMus:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	sub sp, #0x14
	movs r0, #0
	str r0, [sp, #0x10]
	add r0, sp, #0x10
	ldr r2, _0807C0D8 @ =0x05000004
	mov r1, sp
	bl sub_80D6370
	movs r0, #0
	mov r8, r0
	movs r3, #0
	movs r4, #0x80
	lsls r4, r4, #0x11
	adds r5, r4, #0
	mov r6, sp
_0807C01C:
	adds r0, r3, #0
	bl GetMu
	cmp r0, #0
	beq _0807C034
	stm r6!, {r0}
	adds r0, r5, #0
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r5, r5, r1
	asrs r0, r0, #0x18
	mov r8, r0
_0807C034:
	adds r0, r4, #0
	movs r2, #0x80
	lsls r2, r2, #0x11
	adds r4, r4, r2
	asrs r3, r0, #0x18
	cmp r3, #3
	ble _0807C01C
	movs r3, #0
	movs r7, #1
	rsbs r7, r7, #0
	add r7, r8
	mov sb, r7
	cmp r3, sb
	bge _0807C0A4
_0807C050:
	adds r1, r3, #1
	lsls r0, r1, #0x18
	asrs r2, r0, #0x18
	mov sl, r1
	cmp r2, r8
	bge _0807C09A
	lsls r0, r3, #2
	mov r1, sp
	adds r6, r1, r0
	lsls r0, r2, #0x18
	movs r1, #0x80
	lsls r1, r1, #0x11
	adds r5, r0, r1
	lsls r0, r2, #2
	mov r2, sp
	adds r4, r0, r2
	mov ip, r1
_0807C072:
	ldr r3, [r4]
	adds r1, r3, #0
	adds r1, #0x4e
	ldr r2, [r6]
	adds r0, r2, #0
	adds r0, #0x4e
	movs r7, #0
	ldrsh r1, [r1, r7]
	movs r7, #0
	ldrsh r0, [r0, r7]
	cmp r1, r0
	bge _0807C08E
	str r3, [r6]
	str r2, [r4]
_0807C08E:
	adds r0, r5, #0
	add r5, ip
	adds r4, #4
	asrs r2, r0, #0x18
	cmp r2, r8
	blt _0807C072
_0807C09A:
	mov r1, sl
	lsls r0, r1, #0x18
	asrs r3, r0, #0x18
	cmp r3, sb
	blt _0807C050
_0807C0A4:
	movs r3, #0
	cmp r3, r8
	bge _0807C0C6
	movs r6, #0xa
	movs r2, #0x80
	lsls r2, r2, #0x11
	mov r4, sp
	adds r5, r2, #0
_0807C0B4:
	ldm r4!, {r0}
	ldr r1, [r0, #0x30]
	subs r0, r6, r3
	strh r0, [r1, #0x1e]
	adds r0, r2, #0
	adds r2, r2, r5
	asrs r3, r0, #0x18
	cmp r3, r8
	blt _0807C0B4
_0807C0C6:
	add sp, #0x14
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_0807C0D8: .4byte 0x05000004

