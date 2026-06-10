	.syntax unified
	.section .text.SioSend, "ax", %progbits
@ SioSend @ JP 0x08042238 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global SioSend
	.thumb_func
SioSend:
	push {r4, r5, r6, r7, lr}
	mov r7, sl
	mov r6, sb
	mov r5, r8
	push {r5, r6, r7}
	mov sb, r0
	lsls r1, r1, #0x10
	lsrs r5, r1, #0x10
	movs r0, #0
	mov r8, r0
	ldr r0, _080422D8 @ =0x030017EA
	ldrh r3, [r0]
	cmp r5, #0x80
	bhi _080422D0
	lsrs r5, r1, #0x11
	ldr r1, _080422DC @ =0x00004FFF
	adds r4, r5, r1
	ldr r2, _080422E0 @ =0x0203C620
	lsls r0, r3, #1
	adds r0, r0, r2
	strh r1, [r0]
	adds r3, #1
	ldr r6, _080422E4 @ =0x000001FF
	ands r3, r6
	ldr r0, _080422E8 @ =0x030017E8
	ldrh r1, [r0]
	mov ip, r2
	mov sl, r0
	cmp r3, r1
	beq _080422D0
	lsls r0, r3, #1
	add r0, ip
	strh r5, [r0]
	adds r3, #1
	ands r3, r6
	lsls r6, r3, #1
	adds r7, r3, #1
	cmp r3, r1
	beq _080422D0
	movs r2, #0
	cmp r2, r5
	bge _080422AC
	mov r3, sb
_0804228E:
	ldrh r0, [r3]
	adds r2, #1
	adds r1, r0, #0
	muls r1, r2, r1
	adds r0, r4, r1
	lsls r0, r0, #0x10
	lsrs r4, r0, #0x10
	mvns r1, r1
	add r1, r8
	lsls r1, r1, #0x10
	lsrs r1, r1, #0x10
	mov r8, r1
	adds r3, #2
	cmp r2, r5
	blt _0804228E
_080422AC:
	mov r1, ip
	adds r0, r6, r1
	strh r4, [r0]
	ldr r4, _080422E4 @ =0x000001FF
	adds r3, r4, #0
	ands r3, r7
	mov r2, sl
	ldrh r1, [r2]
	cmp r3, r1
	beq _080422D0
	lsls r0, r3, #1
	add r0, ip
	mov r2, r8
	strh r2, [r0]
	adds r3, #1
	ands r3, r4
	cmp r3, r1
	bne _080422EC
_080422D0:
	movs r0, #1
	rsbs r0, r0, #0
	b _0804231C
	.align 2, 0
_080422D8: .4byte 0x030017EA
_080422DC: .4byte 0x00004FFF
_080422E0: .4byte 0x0203C620
_080422E4: .4byte 0x000001FF
_080422E8: .4byte 0x030017E8
_080422EC:
	movs r2, #0
	cmp r2, r5
	bge _08042314
	mov r8, ip
	adds r7, r4, #0
	mov r4, sb
	mov r6, sl
_080422FA:
	lsls r0, r3, #1
	add r0, r8
	ldrh r1, [r4]
	strh r1, [r0]
	adds r3, #1
	ands r3, r7
	ldrh r0, [r6]
	cmp r3, r0
	beq _080422D0
	adds r4, #2
	adds r2, #1
	cmp r2, r5
	blt _080422FA
_08042314:
	ldr r1, _0804232C @ =0x030017EA
	strh r3, [r1]
	lsls r0, r5, #0x10
	asrs r0, r0, #0x10
_0804231C:
	pop {r3, r4, r5}
	mov r8, r3
	mov sb, r4
	mov sl, r5
	pop {r4, r5, r6, r7}
	pop {r1}
	bx r1
	.align 2, 0
_0804232C: .4byte 0x030017EA

