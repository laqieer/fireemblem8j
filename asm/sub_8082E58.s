	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80827D8, 0x080827D8 + 1
	.section .text.sub_8082E58, "ax", %progbits
@ sub_8082E58 @ JP 0x08082E58 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082E58
	.thumb_func
sub_8082E58:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r5, r0, #0
	movs r0, #0x42
	adds r0, r0, r5
	mov r8, r0
	ldrh r7, [r0]
	cmp r7, #0
	bne _08082EAA
	ldr r1, _08082EC0 @ =0x081F52AC
	adds r4, r5, #0
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r6, r5, #0
	adds r6, #0x44
	ldrh r1, [r6]
	bl sub_80827D8
	ldrh r0, [r4]
	adds r0, #1
	strh r0, [r4]
	movs r0, #5
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r4]
	cmp r0, #3
	bls _08082EA2
	strh r7, [r4]
	adds r0, r5, #0
	adds r0, #0x46
	strh r7, [r0]
	adds r0, r5, #0
	bl sub_8002DE4
_08082EA2:
	ldrh r0, [r6]
	movs r1, #1
	eors r0, r1
	strh r0, [r6]
_08082EAA:
	adds r1, r5, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0
	.align 2, 0
_08082EC0: .4byte 0x081F52AC

