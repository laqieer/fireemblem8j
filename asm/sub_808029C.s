	.syntax unified
	.set SetBlendConfig, 0x08001DF0 + 1
	.set memcpy, 0x080D6908 + 1
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_808029C, "ax", %progbits
@ sub_808029C @ JP 0x0808029C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_808029C
	.thumb_func
sub_808029C:
	push {r4, r5, lr}
	sub sp, #0x14
	adds r5, r0, #0
	ldr r1, _080802E8 @ =0x081F51EB
	mov r0, sp
	movs r2, #0x13
	bl memcpy
	adds r4, r5, #0
	adds r4, #0x4a
	ldrh r0, [r4]
	adds r1, r0, #1
	strh r1, [r4]
	lsls r0, r0, #0x10
	asrs r0, r0, #0x10
	add r0, sp
	ldrb r1, [r0]
	movs r0, #1
	movs r2, #0x10
	movs r3, #0
	bl SetBlendConfig
	movs r1, #0
	ldrsh r0, [r4, r1]
	add r0, sp
	ldrb r0, [r0]
	cmp r0, #0xff
	bne _080802DE
	movs r0, #0
	strh r0, [r4]
	adds r0, r5, #0
	bl sub_8002DE4
_080802DE:
	add sp, #0x14
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_080802E8: .4byte 0x081F51EB

