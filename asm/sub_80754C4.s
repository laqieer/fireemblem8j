	.syntax unified
	.set sub_8002BCC, 0x08002BCC + 1
	.set sub_80564F0, 0x080564F0 + 1
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_80754C4, "ax", %progbits
@ sub_80754C4 @ JP 0x080754C4 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_80754C4
	.thumb_func
sub_80754C4:
	push {r4, r5, lr}
	sub sp, #4
	adds r4, r0, #0
	ldr r0, _08075500 @ =0x087A9740
	movs r1, #3
	bl sub_8002BCC
	adds r5, r0, #0
	str r4, [r5, #0x5c]
	ldr r3, _08075504 @ =0x087E6EB0
	str r3, [sp]
	adds r0, r4, #0
	adds r1, r3, #0
	adds r2, r3, #0
	bl sub_80564F0
	str r0, [r5, #0x60]
	ldr r0, _08075508 @ =0x087E66EC
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _0807550C @ =0x087E62F4
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	add sp, #4
	pop {r4, r5}
	pop {r0}
	bx r0
	.align 2, 0
_08075500: .4byte 0x087A9740
_08075504: .4byte 0x087E6EB0
_08075508: .4byte 0x087E66EC
_0807550C: .4byte 0x087E62F4

