	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_8014B50, 0x08014B50 + 1
	.set sub_80827D8, 0x080827D8 + 1
	.section .text.sub_8082A70, "ax", %progbits
@ sub_8082A70 @ JP 0x08082A70 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082A70
	.thumb_func
sub_8082A70:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r4, r0, #0
	movs r0, #0x42
	adds r0, r0, r4
	mov r8, r0
	ldrh r6, [r0]
	cmp r6, #0
	bne _08082AE6
	ldr r1, _08082AFC @ =0x081F5296
	adds r5, r4, #0
	adds r5, #0x40
	ldrh r0, [r5]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r7, r4, #0
	adds r7, #0x44
	ldrh r1, [r7]
	bl sub_80827D8
	ldrh r0, [r5]
	cmp r0, #0
	bne _08082AA8
	ldr r0, _08082B00 @ =0x00000141
	ldr r1, [r4, #0x30]
	bl sub_8014B50
_08082AA8:
	ldrh r0, [r5]
	adds r0, #1
	strh r0, [r5]
	movs r0, #5
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r5]
	cmp r0, #3
	bls _08082ADE
	strh r6, [r5]
	adds r0, r4, #0
	adds r0, #0x46
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	adds r0, #2
	strh r6, [r0]
	ldr r1, _08082B04 @ =0x0202BCAC
	movs r2, #0xc
	ldrsh r0, [r1, r2]
	str r0, [r4, #0x30]
	movs r2, #0xe
	ldrsh r0, [r1, r2]
	str r0, [r4, #0x34]
	adds r0, r4, #0
	bl sub_8002DE4
_08082ADE:
	ldrh r0, [r7]
	movs r1, #1
	eors r0, r1
	strh r0, [r7]
_08082AE6:
	adds r1, r4, #0
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
_08082AFC: .4byte 0x081F5296
_08082B00: .4byte 0x00000141
_08082B04: .4byte 0x0202BCAC

