	.syntax unified
	.section .text.PutFaceTm, "ax", %progbits
@ PutFaceTm @ JP 0x0800579C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global PutFaceTm
	.thumb_func
PutFaceTm:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	mov r8, r0
	mov ip, r2
	lsls r3, r3, #0x18
	ldrb r7, [r1]
	adds r1, #1
	ldrb r6, [r1]
	adds r2, r1, #1
	cmp r3, #0
	bne _080057E6
	movs r0, #0
	cmp r0, r6
	bge _08005820
_080057BA:
	adds r4, r0, #1
	cmp r7, #0
	beq _080057DE
	lsls r0, r0, #6
	mov r3, r8
	adds r1, r0, r3
	adds r3, r7, #0
_080057C8:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _080057D4
	ldrb r0, [r2]
	add r0, ip
	strh r0, [r1]
_080057D4:
	adds r2, #1
	adds r1, #2
	subs r3, #1
	cmp r3, #0
	bne _080057C8
_080057DE:
	adds r0, r4, #0
	cmp r0, r6
	blt _080057BA
	b _08005820
_080057E6:
	movs r0, #0
	cmp r0, r6
	bge _08005820
_080057EC:
	subs r3, r7, #1
	adds r4, r0, #1
	cmp r3, #0
	blt _0800581A
	movs r1, #0x80
	lsls r1, r1, #3
	adds r5, r1, #0
	lsls r1, r3, #1
	lsls r0, r0, #6
	add r0, r8
	adds r1, r1, r0
_08005802:
	ldrb r0, [r2]
	cmp r0, #0xff
	beq _08005810
	ldrb r0, [r2]
	add r0, ip
	adds r0, r0, r5
	strh r0, [r1]
_08005810:
	adds r2, #1
	subs r1, #2
	subs r3, #1
	cmp r3, #0
	bge _08005802
_0800581A:
	adds r0, r4, #0
	cmp r0, r6
	blt _080057EC
_08005820:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0

