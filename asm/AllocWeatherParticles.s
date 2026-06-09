	.syntax unified
	.set InitOam, 0x0800204C + 1
	.section .text.AllocWeatherParticles, "ax", %progbits
@ AllocWeatherParticles @ JP 0x08030144 - region-different, gbadisasm descriptive asm (D23)
	.thumb
	.global AllocWeatherParticles
	.thumb_func
AllocWeatherParticles:
	push {lr}
	subs r0, #1
	cmp r0, #5
	bhi _08030184
	lsls r0, r0, #2
	ldr r1, _08030158 @ =_0803015C
	adds r0, r0, r1
	ldr r0, [r0]
	mov pc, r0
	.align 2, 0
_08030158: .4byte _0803015C
_0803015C: @ jump table
	.4byte _08030174 @ case 0
	.4byte _08030174 @ case 1
	.4byte _08030184 @ case 2
	.4byte _08030174 @ case 3
	.4byte _0803017C @ case 4
	.4byte _08030174 @ case 5
_08030174:
	movs r0, #0x20
	bl InitOam
	b _0803018A
_0803017C:
	movs r0, #0x10
	bl InitOam
	b _0803018A
_08030184:
	movs r0, #0
	bl InitOam
_0803018A:
	pop {r0}
	bx r0
	.align 2, 0

