	.syntax unified
	.set Proc_StartBlocking, 0x08002C30 + 1
	.section .text.sub_80B7398, "ax", %progbits
@ sub_80B7398 @ JP 0x080B7398 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80B7398
	.thumb_func
sub_80B7398:
	push {r4, r5, r6, lr}
	adds r5, r0, #0
	adds r6, r1, #0
	adds r4, r2, #0
	adds r1, r3, #0
	ldr r0, _080B73C8 @ =0x08AAFC24
	bl Proc_StartBlocking
	mov ip, r0
	adds r0, #0x64
	movs r1, #0
	strh r5, [r0]
	mov r0, ip
	str r4, [r0, #0x58]
	adds r0, #0x4e
	strh r1, [r0]
	cmp r6, #1
	beq _080B73DA
	cmp r6, #1
	bgt _080B73CC
	cmp r6, #0
	beq _080B73D2
	b _080B73F2
	.align 2, 0
_080B73C8: .4byte 0x08AAFC24
_080B73CC:
	cmp r6, #2
	beq _080B73E6
	b _080B73F2
_080B73D2:
	movs r0, #0x80
	mov r1, ip
	str r0, [r1, #0x5c]
	b _080B73F0
_080B73DA:
	mov r6, ip
	str r1, [r6, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #2
	str r0, [r6, #0x60]
	b _080B73F2
_080B73E6:
	mov r0, ip
	str r1, [r0, #0x5c]
	movs r0, #0x80
	lsls r0, r0, #3
	mov r1, ip
_080B73F0:
	str r0, [r1, #0x60]
_080B73F2:
	mov r6, ip
	ldr r4, [r6, #0x5c]
	ldr r0, [r6, #0x60]
	adds r0, r4, r0
	cmp r4, r0
	bge _080B7422
	ldr r2, _080B7428 @ =0x02014FE4
	ldr r1, _080B742C @ =0x020228A8
	movs r5, #0
	lsls r0, r4, #1
	adds r3, r0, r1
	adds r2, r0, r2
_080B740A:
	ldrh r0, [r3]
	strh r0, [r2]
	strh r5, [r3]
	adds r3, #2
	adds r2, #2
	adds r4, #1
	mov r1, ip
	ldr r0, [r1, #0x5c]
	ldr r1, [r1, #0x60]
	adds r0, r0, r1
	cmp r4, r0
	blt _080B740A
_080B7422:
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_080B7428: .4byte 0x02014FE4
_080B742C: .4byte 0x020228A8

