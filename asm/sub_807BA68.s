	.syntax unified
	.set sub_8002DE4, 0x08002DE4 + 1
	.section .text.sub_807BA68, "ax", %progbits
@ sub_807BA68 @ JP 0x0807BA68 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_807BA68
	.thumb_func
sub_807BA68:
	push {r4, r5, lr}
	adds r3, r0, #0
	ldr r4, [r3, #0x14]
	movs r5, #0
	adds r2, r3, #0
	adds r2, #0x64
	ldrh r1, [r2]
	movs r0, #7
	ands r0, r1
	cmp r0, #3
	bgt _0807BA80
	movs r5, #1
_0807BA80:
	adds r4, #0x40
	strb r5, [r4]
	ldrh r0, [r2]
	subs r0, #1
	strh r0, [r2]
	lsls r0, r0, #0x10
	cmp r0, #0
	bge _0807BA9A
	adds r0, r3, #0
	bl sub_8002DE4
	movs r0, #1
	strb r0, [r4]
_0807BA9A:
	pop {r4, r5}
	pop {r0}
	bx r0

