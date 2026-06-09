	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.set sub_80827D8, 0x080827D8 + 1
	.section .text.sub_8082BD0, "ax", %progbits
@ sub_8082BD0 @ JP 0x08082BD0 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8082BD0
	.thumb_func
sub_8082BD0:
	push {r4, r5, r6, r7, lr}
	mov r7, r8
	push {r7}
	adds r6, r0, #0
	movs r0, #0x42
	adds r0, r0, r6
	mov r8, r0
	ldrh r7, [r0]
	cmp r7, #0
	bne _08082C2C
	ldr r1, _08082C1C @ =0x081F529C
	adds r4, r6, #0
	adds r4, #0x40
	ldrh r0, [r4]
	adds r0, r0, r1
	ldrb r0, [r0]
	adds r5, r6, #0
	adds r5, #0x44
	ldrh r1, [r5]
	bl sub_80827D8
	movs r0, #3
	mov r1, r8
	strh r0, [r1]
	ldrh r0, [r4]
	cmp r0, #0xa
	bls _08082C20
	strh r7, [r4]
	adds r0, r6, #0
	adds r0, #0x46
	strh r7, [r0]
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
	adds r0, r6, #0
	bl sub_8002DE4
	b _08082C36
	.align 2, 0
_08082C1C: .4byte 0x081F529C
_08082C20:
	adds r0, #1
	strh r0, [r4]
	ldrh r0, [r5]
	movs r1, #1
	eors r0, r1
	strh r0, [r5]
_08082C2C:
	adds r1, r6, #0
	adds r1, #0x42
	ldrh r0, [r1]
	subs r0, #1
	strh r0, [r1]
_08082C36:
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6, r7}
	pop {r0}
	bx r0

