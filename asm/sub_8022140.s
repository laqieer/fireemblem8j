	.syntax unified
	.set sub_8001EE4, 0x08001EE4 + 1
	.section .text.sub_8022140, "ax", %progbits
@ sub_8022140 @ JP 0x08022140 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_8022140
	.thumb_func
sub_8022140:
	push {r4, r5, lr}
	adds r5, r0, #0
	ldr r3, _08022170 @ =0x020228A8
	ldr r2, _08022174 @ =0x00007FFF
	adds r1, r3, #0
	adds r1, #0x42
	movs r0, #0xe
_0802214E:
	strh r2, [r1]
	adds r1, #2
	subs r0, #1
	cmp r0, #0
	bge _0802214E
	movs r4, #0
	ldr r0, _08022174 @ =0x00007FFF
	strh r0, [r3]
	bl sub_8001EE4
	adds r0, r5, #0
	adds r0, #0x4c
	strh r4, [r0]
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08022170: .4byte 0x020228A8
_08022174: .4byte 0x00007FFF

