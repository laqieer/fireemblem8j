	.syntax unified
	.set Proc_Find, 0x08002DEC + 1
	.set sub_80C31B4, 0x080C31B4 + 1
	.section .text.sub_800C934, "ax", %progbits
@ sub_800C934 @ JP 0x0800C934 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_800C934
	.thumb_func
sub_800C934:
	push {r4, r5, lr}
	ldr r0, [r0, #0x38]
	ldrh r4, [r0, #4]
	ldrh r5, [r0, #6]
	ldr r1, _0800C95C @ =0x03005270
	lsls r0, r4, #2
	adds r0, r0, r1
	strb r5, [r0, #0x11]
	ldr r0, _0800C960 @ =0x08AC1108
	bl Proc_Find
	ldr r0, [r0, #0x54]
	adds r1, r4, #0
	adds r2, r5, #0
	bl sub_80C31B4
	movs r0, #0
	pop {r4, r5}
	pop {r1}
	bx r1
	.align 2, 0
_0800C95C: .4byte 0x03005270
_0800C960: .4byte 0x08AC1108

