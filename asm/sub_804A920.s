	.syntax unified
	.set __umodsi3, 0x080D6848 + 1
	.section .text.sub_804A920, "ax", %progbits
@ sub_804A920 @ JP 0x0804A920 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_804A920
	.thumb_func
sub_804A920:
	push {r4, r5, r6, r7, lr}
	lsls r0, r0, #0x10
	lsrs r3, r0, #0x10
	lsls r1, r1, #0x18
	asrs r7, r1, #0x18
	ldr r1, _0804A94C @ =0x0203DD8C
	ldrb r2, [r1, #2]
	adds r5, r2, #0
	strb r2, [r1, #3]
	movs r0, #0xf0
	ands r0, r3
	adds r6, r1, #0
	cmp r0, #0
	beq _0804AA06
	lsls r4, r2, #2
	movs r0, #0x40
	ands r0, r3
	cmp r0, #0
	beq _0804A954
	ldr r0, _0804A950 @ =0x085D4200
	adds r0, r4, r0
	b _0804A98A
	.align 2, 0
_0804A94C: .4byte 0x0203DD8C
_0804A950: .4byte 0x085D4200
_0804A954:
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0804A968
	ldr r1, _0804A964 @ =0x085D4200
	adds r0, r4, #1
	b _0804A988
	.align 2, 0
_0804A964: .4byte 0x085D4200
_0804A968:
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0804A97C
	ldr r1, _0804A978 @ =0x085D4200
	adds r0, r4, #2
	b _0804A988
	.align 2, 0
_0804A978: .4byte 0x085D4200
_0804A97C:
	movs r0, #0x10
	ands r0, r3
	cmp r0, #0
	beq _0804A98C
	ldr r1, _0804A9E4 @ =0x085D4200
	adds r0, r4, #3
_0804A988:
	adds r0, r0, r1
_0804A98A:
	ldrb r2, [r0]
_0804A98C:
	subs r5, r2, r5
	ldrb r0, [r6, #3]
	cmp r0, #0
	bne _0804A9A0
	movs r0, #0x20
	ands r0, r3
	cmp r0, #0
	beq _0804A9A0
	movs r5, #1
	rsbs r5, r5, #0
_0804A9A0:
	ldrb r0, [r6, #3]
	cmp r0, #0x13
	bne _0804A9B0
	movs r0, #0x80
	ands r0, r3
	cmp r0, #0
	beq _0804A9B0
	movs r5, #1
_0804A9B0:
	ldr r4, _0804A9E8 @ =0x03001810
_0804A9B2:
	adds r0, r2, r4
	ldrb r0, [r0]
	lsls r0, r0, #0x18
	cmp r0, #0
	beq _0804A9D0
	cmp r7, #0
	beq _0804AA04
	lsrs r1, r0, #0x1e
	ldr r0, _0804A9EC @ =0x085D31E8
	ldr r0, [r0]
	ldrb r0, [r0, #6]
	lsls r0, r0, #0x18
	asrs r0, r0, #0x18
	cmp r1, r0
	bne _0804AA04
_0804A9D0:
	cmp r5, #0
	bge _0804A9F0
	subs r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	cmp r2, #0xff
	bne _0804A9B2
	movs r2, #0x13
	b _0804A9B2
	.align 2, 0
_0804A9E4: .4byte 0x085D4200
_0804A9E8: .4byte 0x03001810
_0804A9EC: .4byte 0x085D31E8
_0804A9F0:
	adds r0, r2, #1
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	adds r0, r2, #0
	movs r1, #0x14
	bl __umodsi3
	lsls r0, r0, #0x18
	lsrs r2, r0, #0x18
	b _0804A9B2
_0804AA04:
	strb r2, [r6, #2]
_0804AA06:
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

