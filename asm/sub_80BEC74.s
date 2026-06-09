	.syntax unified
	.set NewGmapSogu, 0x080C6448 + 1
	.set sub_80C318C, 0x080C318C + 1
	.section .text.sub_80BEC74, "ax", %progbits
@ sub_80BEC74 @ JP 0x080BEC74 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80BEC74
	.thumb_func
sub_80BEC74:
	push {r4, lr}
	sub sp, #4
	ldr r0, [r0, #0x54]
	mov r4, sp
	adds r4, #2
	movs r1, #0
	mov r2, sp
	adds r3, r4, #0
	bl sub_80C318C
	mov r0, sp
	movs r1, #0
	ldrsh r0, [r0, r1]
	movs r2, #0
	ldrsh r1, [r4, r2]
	bl NewGmapSogu
	mov r3, sp
	ldr r1, _080BECCC @ =0x03005270
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #5
	ldr r2, _080BECD0 @ =0x081F5D7C
	adds r0, r0, r2
	ldrh r0, [r0, #0x18]
	strh r0, [r3]
	ldrb r0, [r1, #0x11]
	lsls r0, r0, #5
	adds r0, r0, r2
	ldrh r0, [r0, #0x1a]
	strh r0, [r4]
	mov r0, sp
	movs r2, #0
	ldrsh r0, [r0, r2]
	lsls r0, r0, #8
	str r0, [r1, #8]
	movs r2, #0
	ldrsh r0, [r4, r2]
	lsls r0, r0, #8
	str r0, [r1, #0xc]
	add sp, #4
	pop {r4}
	pop {r0}
	bx r0
	.align 2, 0
_080BECCC: .4byte 0x03005270
_080BECD0: .4byte 0x081F5D7C

