	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80827D8, 0x080827D8 + 1
	.section .text.sub_8082B08, "ax", %progbits
@ sub_8082B08 @ JP 0x08082B08 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082B08
	.thumb_func
sub_8082B08:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	adds r0, #0x46
	ldrh r0, [r0]
	cmp r0, #5
	bne _08082B2C
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r2, #0
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5, #0x50]
	strh r2, [r0, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #2
	b _08082B58
_08082B2C:
	cmp r0, #8
	bne _08082B42
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r0, [r5, #0x50]
	strh r1, [r0, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #3
	b _08082B58
_08082B42:
	cmp r0, #0xb
	bne _08082B5A
	ldr r0, [r5, #0x50]
	adds r0, #0x29
	movs r1, #1
	strb r1, [r0]
	ldr r1, [r5, #0x50]
	movs r0, #2
	strh r0, [r1, #0x2a]
	ldr r1, [r5, #0x50]
	movs r0, #4
_08082B58:
	strh r0, [r1, #0x34]
_08082B5A:
	adds r0, r5, #0
	adds r0, #0x42
	ldrh r7, [r0]
	mov r8, r0
	cmp r7, #0
	bne _08082BBE
	ldr r1, _08082BA4 @ =0x081F529A
	adds r6, r5, #0
	adds r6, #0x40
	ldrh r0, [r6]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r4, r5, #0
	adds r4, #0x44
	ldrh r1, [r4]
	bl sub_80827D8
	ldrh r0, [r6]
	adds r0, #1
	strh r0, [r6]
	movs r0, #4
	mov r1, r8
	strh r0, [r1]
	adds r1, r5, #0
	adds r1, #0x46
	ldrh r0, [r1]
	cmp r0, #0x15
	bls _08082BA8
	ldrh r0, [r6]
	cmp r0, #1
	bls _08082BB6
	strh r7, [r6]
	strh r7, [r1]
	adds r0, r5, #0
	bl sub_8002DE4
	b _08082BB6
	.align 2, 0
_08082BA4: .4byte 0x081F529A
_08082BA8:
	ldrh r0, [r6]
	cmp r0, #1
	bls _08082BB6
	strh r7, [r6]
	ldrh r0, [r1]
	adds r0, #1
	strh r0, [r1]
_08082BB6:
	ldrh r0, [r4]
	movs r1, #1
	eors r0, r1
	strh r0, [r4]
_08082BBE:
	mov r1, r8
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

