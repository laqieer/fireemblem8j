	.syntax unified
	.set sub_8056774, 0x08056774 + 1
	.set sub_805679C, 0x0805679C + 1
	.section .text.sub_806923C, "ax", %progbits
@ sub_806923C @ JP 0x0806923C - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global sub_806923C
	.thumb_func
sub_806923C:
	push {lr}
	ldr r0, _08069254 @ =0x087F9670
	movs r1, #0x20
	bl sub_805679C
	ldr r0, _08069258 @ =0x087F9444
	movs r1, #0x80
	lsls r1, r1, #5
	bl sub_8056774
	pop {r0}
	bx r0
	.align 2, 0
_08069254: .4byte 0x087F9670
_08069258: .4byte 0x087F9444

