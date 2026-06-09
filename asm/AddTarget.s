	.syntax unified
	.section .text.AddTarget, "ax", %progbits
@ AddTarget @ JP 0x08050630 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AddTarget
	.thumb_func
AddTarget:
	push {r4, r5, r6, lr}
	mov r6, r8
	push {r6}
	ldr r4, _0805067C @ =0x0203DDE8
	mov r8, r4
	ldr r6, _08050680 @ =0x0203E0E8
	ldr r5, [r6]
	lsls r4, r5, #1
	adds r4, r4, r5
	lsls r4, r4, #2
	add r4, r8
	strb r0, [r4]
	ldr r4, [r6]
	lsls r0, r4, #1
	adds r0, r0, r4
	lsls r0, r0, #2
	add r0, r8
	strb r1, [r0, #1]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r2, [r0, #2]
	ldr r1, [r6]
	lsls r0, r1, #1
	adds r0, r0, r1
	lsls r0, r0, #2
	add r0, r8
	strb r3, [r0, #3]
	ldr r0, [r6]
	adds r0, #1
	str r0, [r6]
	pop {r3}
	mov r8, r3
	pop {r4, r5, r6}
	pop {r0}
	bx r0
	.align 2, 0
_0805067C: .4byte 0x0203DDE8
_08050680: .4byte 0x0203E0E8

